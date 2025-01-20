@interface ABSPBFavoritesEntry
- (BOOL)hasAbIdentifier;
- (BOOL)hasActionType;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasEntryType;
- (BOOL)hasGuid;
- (BOOL)hasLabel;
- (BOOL)hasName;
- (BOOL)hasProperty;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionType;
- (NSString)bundleIdentifier;
- (NSString)guid;
- (NSString)label;
- (NSString)name;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)abIdentifier;
- (int)entryType;
- (int)property;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbIdentifier:(int)a3;
- (void)setActionType:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setEntryType:(int)a3;
- (void)setGuid:(id)a3;
- (void)setHasAbIdentifier:(BOOL)a3;
- (void)setHasEntryType:(BOOL)a3;
- (void)setHasProperty:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setName:(id)a3;
- (void)setProperty:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBFavoritesEntry

- (void)setEntryType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_entryType = a3;
}

- (void)setHasEntryType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntryType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAbIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_abIdentifier = a3;
}

- (void)setHasAbIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProperty:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_property = a3;
}

- (void)setHasProperty:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProperty
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (BOOL)hasActionType
{
  return self->_actionType != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBFavoritesEntry;
  char v3 = [(ABSPBFavoritesEntry *)&v7 description];
  v4 = [(ABSPBFavoritesEntry *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v13 = +[NSNumber numberWithInt:self->_entryType];
    [v3 setObject:v13 forKey:@"entryType"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v14 = +[NSNumber numberWithInt:self->_abIdentifier];
  [v3 setObject:v14 forKey:@"abIdentifier"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithInt:self->_property];
    [v3 setObject:v5 forKey:@"property"];
  }
LABEL_5:
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  actionType = self->_actionType;
  if (actionType) {
    [v3 setObject:actionType forKey:@"actionType"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v3 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBFavoritesEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_value)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_guid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_actionType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[8] = self->_entryType;
    *((unsigned char *)v4 + 80) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_abIdentifier;
  *((unsigned char *)v4 + 80) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[16] = self->_property;
    *((unsigned char *)v4 + 80) |= 4u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_value)
  {
    [v4 setValue:];
    id v4 = v6;
  }
  if (self->_name)
  {
    [v6 setName:];
    id v4 = v6;
  }
  if (self->_label)
  {
    [v6 setLabel:];
    id v4 = v6;
  }
  if (self->_guid)
  {
    [v6 setGuid:];
    id v4 = v6;
  }
  if (self->_actionType)
  {
    [v6 setActionType:];
    id v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    [v6 setBundleIdentifier:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 2) = self->_abIdentifier;
    *((unsigned char *)v5 + 80) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 8) = self->_entryType;
  *((unsigned char *)v5 + 80) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 16) = self->_property;
    *((unsigned char *)v5 + 80) |= 4u;
  }
LABEL_5:
  id v8 = [(NSString *)self->_value copyWithZone:a3];
  v9 = (void *)v6[9];
  v6[9] = v8;

  id v10 = [(NSString *)self->_name copyWithZone:a3];
  v11 = (void *)v6[7];
  v6[7] = v10;

  id v12 = [(NSString *)self->_label copyWithZone:a3];
  v13 = (void *)v6[6];
  v6[6] = v12;

  id v14 = [(NSString *)self->_guid copyWithZone:a3];
  v15 = (void *)v6[5];
  v6[5] = v14;

  id v16 = [(NSString *)self->_actionType copyWithZone:a3];
  v17 = (void *)v6[2];
  v6[2] = v16;

  id v18 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v19 = (void *)v6[3];
  v6[3] = v18;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_entryType != *((_DWORD *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
LABEL_29:
    unsigned __int8 v11 = 0;
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_abIdentifier != *((_DWORD *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_property != *((_DWORD *)v4 + 16)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_29;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 9) && !-[NSString isEqual:](value, "isEqual:")) {
    goto LABEL_29;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_29;
    }
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](label, "isEqual:")) {
      goto LABEL_29;
    }
  }
  guid = self->_guid;
  if ((unint64_t)guid | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](guid, "isEqual:")) {
      goto LABEL_29;
    }
  }
  actionType = self->_actionType;
  if ((unint64_t)actionType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionType, "isEqual:")) {
      goto LABEL_29;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 3)) {
    unsigned __int8 v11 = -[NSString isEqual:](bundleIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_entryType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_abIdentifier;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_property;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_value hash];
  NSUInteger v7 = [(NSString *)self->_name hash];
  unint64_t v8 = v6 ^ v7 ^ [(NSString *)self->_label hash];
  NSUInteger v9 = [(NSString *)self->_guid hash];
  unint64_t v10 = v9 ^ [(NSString *)self->_actionType hash];
  return v8 ^ v10 ^ [(NSString *)self->_bundleIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 80);
  if ((v5 & 2) != 0)
  {
    self->_entryType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 80);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_abIdentifier = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
LABEL_4:
    self->_property = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  id v6 = v4;
  if (*((void *)v4 + 9))
  {
    -[ABSPBFavoritesEntry setValue:](self, "setValue:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[ABSPBFavoritesEntry setName:](self, "setName:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[ABSPBFavoritesEntry setLabel:](self, "setLabel:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[ABSPBFavoritesEntry setGuid:](self, "setGuid:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[ABSPBFavoritesEntry setActionType:](self, "setActionType:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[ABSPBFavoritesEntry setBundleIdentifier:](self, "setBundleIdentifier:");
    id v4 = v6;
  }
}

- (int)entryType
{
  return self->_entryType;
}

- (int)abIdentifier
{
  return self->_abIdentifier;
}

- (int)property
{
  return self->_property;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_actionType, 0);
}

@end