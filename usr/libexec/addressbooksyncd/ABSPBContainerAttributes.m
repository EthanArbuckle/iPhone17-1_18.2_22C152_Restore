@interface ABSPBContainerAttributes
- (ABSPBContainerPermissions)permissions;
- (BOOL)enabled;
- (BOOL)guardianRestricted;
- (BOOL)hasAccountExternalIdentifier;
- (BOOL)hasEnabled;
- (BOOL)hasGuardianRestricted;
- (BOOL)hasName;
- (BOOL)hasParentallyManaged;
- (BOOL)hasPermissions;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)parentallyManaged;
- (BOOL)readFrom:(id)a3;
- (NSString)accountExternalIdentifier;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountExternalIdentifier:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGuardianRestricted:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasGuardianRestricted:(BOOL)a3;
- (void)setHasParentallyManaged:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setParentallyManaged:(BOOL)a3;
- (void)setPermissions:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBContainerAttributes

- (void)setEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPermissions
{
  return self->_permissions != 0;
}

- (void)setGuardianRestricted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_guardianRestricted = a3;
}

- (void)setHasGuardianRestricted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGuardianRestricted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setParentallyManaged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_parentallyManaged = a3;
}

- (void)setHasParentallyManaged:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasParentallyManaged
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAccountExternalIdentifier
{
  return self->_accountExternalIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBContainerAttributes;
  char v3 = [(ABSPBContainerAttributes *)&v7 description];
  v4 = [(ABSPBContainerAttributes *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = +[NSNumber numberWithBool:self->_enabled];
    [v3 setObject:v4 forKey:@"enabled"];
  }
  permissions = self->_permissions;
  if (permissions)
  {
    v6 = [(ABSPBContainerPermissions *)permissions dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"permissions"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_guardianRestricted];
    [v3 setObject:v8 forKey:@"guardianRestricted"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_parentallyManaged];
    [v3 setObject:v9 forKey:@"parentallyManaged"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = +[NSNumber numberWithInt:self->_type];
    [v3 setObject:v11 forKey:@"type"];
  }
  accountExternalIdentifier = self->_accountExternalIdentifier;
  if (accountExternalIdentifier) {
    [v3 setObject:accountExternalIdentifier forKey:@"accountExternalIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBContainerAttributesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_permissions)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_accountExternalIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[36] = self->_enabled;
    v4[40] |= 2u;
  }
  id v6 = v4;
  if (self->_permissions)
  {
    [v4 setPermissions:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[37] = self->_guardianRestricted;
    v4[40] |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[38] = self->_parentallyManaged;
    v4[40] |= 8u;
  }
  if (self->_name)
  {
    [v6 setName:];
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    v4[40] |= 1u;
  }
  if (self->_accountExternalIdentifier)
  {
    [v6 setAccountExternalIdentifier:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[36] = self->_enabled;
    v5[40] |= 2u;
  }
  id v7 = [(ABSPBContainerPermissions *)self->_permissions copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v6 + 37) = self->_guardianRestricted;
    *((unsigned char *)v6 + 40) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((unsigned char *)v6 + 38) = self->_parentallyManaged;
    *((unsigned char *)v6 + 40) |= 8u;
  }
  id v10 = [(NSString *)self->_name copyWithZone:a3];
  v11 = (void *)v6[2];
  v6[2] = v10;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 8) = self->_type;
    *((unsigned char *)v6 + 40) |= 1u;
  }
  id v12 = [(NSString *)self->_accountExternalIdentifier copyWithZone:a3];
  v13 = (void *)v6[1];
  v6[1] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0) {
      goto LABEL_39;
    }
    if (self->_enabled)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_39;
  }
  permissions = self->_permissions;
  if ((unint64_t)permissions | *((void *)v4 + 3))
  {
    if (!-[ABSPBContainerPermissions isEqual:](permissions, "isEqual:")) {
      goto LABEL_39;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0) {
      goto LABEL_39;
    }
    if (self->_guardianRestricted)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0) {
      goto LABEL_39;
    }
    if (self->_parentallyManaged)
    {
      if (!*((unsigned char *)v4 + 38)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 38))
    {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_39;
  }
  name = self->_name;
  if (!((unint64_t)name | *((void *)v4 + 2))) {
    goto LABEL_32;
  }
  if (!-[NSString isEqual:](name, "isEqual:"))
  {
LABEL_39:
    unsigned __int8 v9 = 0;
    goto LABEL_40;
  }
  char has = (char)self->_has;
LABEL_32:
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_39;
  }
  accountExternalIdentifier = self->_accountExternalIdentifier;
  if ((unint64_t)accountExternalIdentifier | *((void *)v4 + 1)) {
    unsigned __int8 v9 = -[NSString isEqual:](accountExternalIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_40:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_enabled;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ABSPBContainerPermissions *)self->_permissions hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_guardianRestricted;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_parentallyManaged;
      goto LABEL_9;
    }
  }
  uint64_t v6 = 0;
LABEL_9:
  NSUInteger v7 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_type;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_accountExternalIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if ((v4[40] & 2) != 0)
  {
    self->_enabled = v4[36];
    *(unsigned char *)&self->_has |= 2u;
  }
  permissions = self->_permissions;
  uint64_t v7 = *((void *)v5 + 3);
  unsigned __int8 v9 = v5;
  if (permissions)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ABSPBContainerPermissions mergeFrom:](permissions, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ABSPBContainerAttributes setPermissions:](self, "setPermissions:");
  }
  uint64_t v5 = v9;
LABEL_9:
  char v8 = v5[40];
  if ((v8 & 4) != 0)
  {
    self->_guardianRestricted = v5[37];
    *(unsigned char *)&self->_has |= 4u;
    char v8 = v5[40];
  }
  if ((v8 & 8) != 0)
  {
    self->_parentallyManaged = v5[38];
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v5 + 2))
  {
    -[ABSPBContainerAttributes setName:](self, "setName:");
    uint64_t v5 = v9;
  }
  if (v5[40])
  {
    self->_type = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 1)) {
    -[ABSPBContainerAttributes setAccountExternalIdentifier:](self, "setAccountExternalIdentifier:");
  }

  _objc_release_x1();
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (ABSPBContainerPermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
}

- (BOOL)guardianRestricted
{
  return self->_guardianRestricted;
}

- (BOOL)parentallyManaged
{
  return self->_parentallyManaged;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (NSString)accountExternalIdentifier
{
  return self->_accountExternalIdentifier;
}

- (void)setAccountExternalIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_accountExternalIdentifier, 0);
}

@end