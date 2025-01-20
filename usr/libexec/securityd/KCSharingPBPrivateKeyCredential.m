@interface KCSharingPBPrivateKeyCredential
- (BOOL)hasAccessGroup;
- (BOOL)hasApplicationLabel;
- (BOOL)hasApplicationTag;
- (BOOL)hasCreationDate;
- (BOOL)hasEffectiveKeySize;
- (BOOL)hasKeyMaterial;
- (BOOL)hasKeySizeInBits;
- (BOOL)hasKeyType;
- (BOOL)hasLabel;
- (BOOL)hasModificationDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)applicationLabel;
- (NSData)applicationTag;
- (NSData)keyMaterial;
- (NSString)accessGroup;
- (NSString)label;
- (PBUnknownFields)unknownFields;
- (double)creationDate;
- (double)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)effectiveKeySize;
- (int64_t)keySizeInBits;
- (int64_t)keyType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAccessGroup:(id)a3;
- (void)setApplicationLabel:(id)a3;
- (void)setApplicationTag:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setEffectiveKeySize:(int64_t)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasEffectiveKeySize:(BOOL)a3;
- (void)setHasKeySizeInBits:(BOOL)a3;
- (void)setHasKeyType:(BOOL)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setKeyMaterial:(id)a3;
- (void)setKeySizeInBits:(int64_t)a3;
- (void)setKeyType:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setModificationDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCSharingPBPrivateKeyCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_keyMaterial, 0);
  objc_storeStrong((id *)&self->_applicationTag, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (int64_t)effectiveKeySize
{
  return self->_effectiveKeySize;
}

- (int64_t)keySizeInBits
{
  return self->_keySizeInBits;
}

- (void)setKeyMaterial:(id)a3
{
}

- (NSData)keyMaterial
{
  return self->_keyMaterial;
}

- (void)setApplicationLabel:(id)a3
{
}

- (NSData)applicationLabel
{
  return self->_applicationLabel;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setApplicationTag:(id)a3
{
}

- (NSData)applicationTag
{
  return self->_applicationTag;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 7))
  {
    -[KCSharingPBPrivateKeyCredential setAccessGroup:](self, "setAccessGroup:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
    self->_keyType = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 9))
  {
    -[KCSharingPBPrivateKeyCredential setApplicationTag:](self, "setApplicationTag:");
    id v4 = v6;
  }
  if (*((void *)v4 + 11))
  {
    -[KCSharingPBPrivateKeyCredential setLabel:](self, "setLabel:");
    id v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[KCSharingPBPrivateKeyCredential setApplicationLabel:](self, "setApplicationLabel:");
    id v4 = v6;
  }
  if (*((void *)v4 + 10))
  {
    -[KCSharingPBPrivateKeyCredential setKeyMaterial:](self, "setKeyMaterial:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 96);
  if ((v5 & 4) != 0)
  {
    self->_keySizeInBits = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 96);
    if ((v5 & 2) == 0)
    {
LABEL_15:
      if ((v5 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) == 0)
  {
    goto LABEL_15;
  }
  self->_effectiveKeySize = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 96);
  if ((v5 & 1) == 0)
  {
LABEL_16:
    if ((v5 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_23:
  self->_creationDate = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 96) & 0x10) != 0)
  {
LABEL_17:
    self->_modificationDate = *((double *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_18:
}

- (unint64_t)hash
{
  NSUInteger v23 = [(NSString *)self->_accessGroup hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    id v3 = [(NSData *)self->_applicationTag hash];
  }
  else {
    id v3 = [(NSData *)self->_applicationTag hash];
  }
  unint64_t v4 = (unint64_t)v3;
  NSUInteger v5 = [(NSString *)self->_label hash];
  unint64_t v6 = (unint64_t)[(NSData *)self->_applicationLabel hash];
  unint64_t v7 = (unint64_t)[(NSData *)self->_keyMaterial hash];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v10 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v15 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = 2654435761 * self->_keySizeInBits;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v10 = 2654435761 * self->_effectiveKeySize;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  double creationDate = self->_creationDate;
  double v12 = -creationDate;
  if (creationDate >= 0.0) {
    double v12 = self->_creationDate;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_16:
  if ((has & 0x10) != 0)
  {
    double modificationDate = self->_modificationDate;
    double v18 = -modificationDate;
    if (modificationDate >= 0.0) {
      double v18 = self->_modificationDate;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  return v22 ^ v23 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v15 ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  accessGroup = self->_accessGroup;
  if ((unint64_t)accessGroup | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](accessGroup, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 8) == 0 || self->_keyType != *((void *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
LABEL_36:
    BOOL v10 = 0;
    goto LABEL_37;
  }
  applicationTag = self->_applicationTag;
  if ((unint64_t)applicationTag | *((void *)v4 + 9)
    && !-[NSData isEqual:](applicationTag, "isEqual:"))
  {
    goto LABEL_36;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](label, "isEqual:")) {
      goto LABEL_36;
    }
  }
  applicationLabel = self->_applicationLabel;
  if ((unint64_t)applicationLabel | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](applicationLabel, "isEqual:")) {
      goto LABEL_36;
    }
  }
  keyMaterial = self->_keyMaterial;
  if ((unint64_t)keyMaterial | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](keyMaterial, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_keySizeInBits != *((void *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_effectiveKeySize != *((void *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_creationDate != *((double *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_36;
  }
  BOOL v10 = (*((unsigned char *)v4 + 96) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 0x10) == 0 || self->_modificationDate != *((double *)v4 + 6)) {
      goto LABEL_36;
    }
    BOOL v10 = 1;
  }
LABEL_37:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_accessGroup copyWithZone:a3];
  unint64_t v7 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v6;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)v5 + 5) = self->_keyType;
    *((unsigned char *)v5 + 96) |= 8u;
  }
  id v8 = [(NSData *)self->_applicationTag copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v8;

  id v10 = [(NSString *)self->_label copyWithZone:a3];
  v11 = (void *)*((void *)v5 + 11);
  *((void *)v5 + 11) = v10;

  id v12 = [(NSData *)self->_applicationLabel copyWithZone:a3];
  long double v13 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v12;

  id v14 = [(NSData *)self->_keyMaterial copyWithZone:a3];
  unint64_t v15 = (void *)*((void *)v5 + 10);
  *((void *)v5 + 10) = v14;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v5 + 4) = self->_keySizeInBits;
    *((unsigned char *)v5 + 96) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *((void *)v5 + 2) = *(void *)&self->_creationDate;
      *((unsigned char *)v5 + 96) |= 1u;
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v5 + 3) = self->_effectiveKeySize;
  *((unsigned char *)v5 + 96) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *((void *)v5 + 6) = *(void *)&self->_modificationDate;
    *((unsigned char *)v5 + 96) |= 0x10u;
  }
LABEL_8:
  objc_storeStrong((id *)v5 + 1, self->_unknownFields);
  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_accessGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_applicationTag)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_applicationLabel)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_keyMaterial)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_17:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_18:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C8A68((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  accessGroup = self->_accessGroup;
  if (accessGroup) {
    [v3 setObject:accessGroup forKey:@"accessGroup"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    id v6 = +[NSNumber numberWithLongLong:self->_keyType];
    [v4 setObject:v6 forKey:@"keyType"];
  }
  applicationTag = self->_applicationTag;
  if (applicationTag) {
    [v4 setObject:applicationTag forKey:@"applicationTag"];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKey:@"label"];
  }
  applicationLabel = self->_applicationLabel;
  if (applicationLabel) {
    [v4 setObject:applicationLabel forKey:@"applicationLabel"];
  }
  keyMaterial = self->_keyMaterial;
  if (keyMaterial) {
    [v4 setObject:keyMaterial forKey:@"keyMaterial"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    unint64_t v16 = +[NSNumber numberWithLongLong:self->_keySizeInBits];
    [v4 setObject:v16 forKey:@"keySizeInBits"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  v17 = +[NSNumber numberWithLongLong:self->_effectiveKeySize];
  [v4 setObject:v17 forKey:@"effectiveKeySize"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_25:
  double v18 = +[NSNumber numberWithDouble:self->_creationDate];
  [v4 setObject:v18 forKey:@"creationDate"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_17:
    id v12 = +[NSNumber numberWithDouble:self->_modificationDate];
    [v4 setObject:v12 forKey:@"modificationDate"];
  }
LABEL_18:
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    id v14 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCSharingPBPrivateKeyCredential;
  id v3 = [(KCSharingPBPrivateKeyCredential *)&v7 description];
  id v4 = [(KCSharingPBPrivateKeyCredential *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasModificationDate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasModificationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_double modificationDate = a3;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double creationDate = a3;
}

- (BOOL)hasEffectiveKeySize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEffectiveKeySize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEffectiveKeySize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_effectiveKeySize = a3;
}

- (BOOL)hasKeySizeInBits
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasKeySizeInBits:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setKeySizeInBits:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_keySizeInBits = a3;
}

- (BOOL)hasKeyMaterial
{
  return self->_keyMaterial != 0;
}

- (BOOL)hasApplicationLabel
{
  return self->_applicationLabel != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasApplicationTag
{
  return self->_applicationTag != 0;
}

- (BOOL)hasKeyType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasKeyType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setKeyType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_keyType = a3;
}

- (BOOL)hasAccessGroup
{
  return self->_accessGroup != 0;
}

@end