@interface CSDMessagingMemberAssociationClaim
- (BOOL)hasAssociatedPseudonym;
- (BOOL)hasConversationGroupUUIDString;
- (BOOL)hasPrimaryAvcIdentifier;
- (BOOL)hasPrimaryHandle;
- (BOOL)hasPrimaryIdentifier;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingHandle)associatedPseudonym;
- (CSDMessagingHandle)primaryHandle;
- (NSString)conversationGroupUUIDString;
- (NSString)primaryAvcIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tuAssociationForHandle:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)primaryIdentifier;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedPseudonym:(id)a3;
- (void)setConversationGroupUUIDString:(id)a3;
- (void)setHasPrimaryIdentifier:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPrimaryAvcIdentifier:(id)a3;
- (void)setPrimaryHandle:(id)a3;
- (void)setPrimaryIdentifier:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingMemberAssociationClaim

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasPrimaryHandle
{
  return self->_primaryHandle != 0;
}

- (void)setPrimaryIdentifier:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_primaryIdentifier = a3;
}

- (void)setHasPrimaryIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrimaryIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPrimaryAvcIdentifier
{
  return self->_primaryAvcIdentifier != 0;
}

- (BOOL)hasAssociatedPseudonym
{
  return self->_associatedPseudonym != 0;
}

- (BOOL)hasConversationGroupUUIDString
{
  return self->_conversationGroupUUIDString != 0;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingMemberAssociationClaim;
  char v3 = [(CSDMessagingMemberAssociationClaim *)&v7 description];
  v4 = [(CSDMessagingMemberAssociationClaim *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  primaryHandle = self->_primaryHandle;
  if (primaryHandle)
  {
    v6 = [(CSDMessagingHandle *)primaryHandle dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"primaryHandle"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedLongLong:self->_primaryIdentifier];
    [v3 setObject:v7 forKey:@"primaryIdentifier"];
  }
  primaryAvcIdentifier = self->_primaryAvcIdentifier;
  if (primaryAvcIdentifier) {
    [v3 setObject:primaryAvcIdentifier forKey:@"primaryAvcIdentifier"];
  }
  associatedPseudonym = self->_associatedPseudonym;
  if (associatedPseudonym)
  {
    v10 = [(CSDMessagingHandle *)associatedPseudonym dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"associatedPseudonym"];
  }
  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if (conversationGroupUUIDString) {
    [v3 setObject:conversationGroupUUIDString forKey:@"conversationGroupUUIDString"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v12 = +[NSNumber numberWithInt:self->_type];
    [v3 setObject:v12 forKey:@"type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000E0D38((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_primaryHandle) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_primaryAvcIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_associatedPseudonym) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_conversationGroupUUIDString) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[13] = self->_version;
    *((unsigned char *)v4 + 56) |= 4u;
  }
  v5 = v4;
  if (self->_primaryHandle)
  {
    objc_msgSend(v4, "setPrimaryHandle:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_primaryIdentifier;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if (self->_primaryAvcIdentifier)
  {
    objc_msgSend(v5, "setPrimaryAvcIdentifier:");
    id v4 = v5;
  }
  if (self->_associatedPseudonym)
  {
    objc_msgSend(v5, "setAssociatedPseudonym:");
    id v4 = v5;
  }
  if (self->_conversationGroupUUIDString)
  {
    objc_msgSend(v5, "setConversationGroupUUIDString:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[12] = self->_type;
    *((unsigned char *)v4 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[13] = self->_version;
    *((unsigned char *)v5 + 56) |= 4u;
  }
  id v7 = [(CSDMessagingHandle *)self->_primaryHandle copyWithZone:a3];
  v8 = (void *)v6[5];
  v6[5] = v7;

  if (*(unsigned char *)&self->_has)
  {
    v6[1] = self->_primaryIdentifier;
    *((unsigned char *)v6 + 56) |= 1u;
  }
  id v9 = [(NSString *)self->_primaryAvcIdentifier copyWithZone:a3];
  v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = [(CSDMessagingHandle *)self->_associatedPseudonym copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  id v13 = [(NSString *)self->_conversationGroupUUIDString copyWithZone:a3];
  v14 = (void *)v6[3];
  v6[3] = v13;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_type;
    *((unsigned char *)v6 + 56) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_version != *((_DWORD *)v4 + 13)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_25;
  }
  primaryHandle = self->_primaryHandle;
  if ((unint64_t)primaryHandle | *((void *)v4 + 5))
  {
    if (!-[CSDMessagingHandle isEqual:](primaryHandle, "isEqual:"))
    {
LABEL_25:
      BOOL v10 = 0;
      goto LABEL_26;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_primaryIdentifier != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_25;
  }
  primaryAvcIdentifier = self->_primaryAvcIdentifier;
  if ((unint64_t)primaryAvcIdentifier | *((void *)v4 + 4)
    && !-[NSString isEqual:](primaryAvcIdentifier, "isEqual:"))
  {
    goto LABEL_25;
  }
  associatedPseudonym = self->_associatedPseudonym;
  if ((unint64_t)associatedPseudonym | *((void *)v4 + 2))
  {
    if (!-[CSDMessagingHandle isEqual:](associatedPseudonym, "isEqual:")) {
      goto LABEL_25;
    }
  }
  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if ((unint64_t)conversationGroupUUIDString | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](conversationGroupUUIDString, "isEqual:")) {
      goto LABEL_25;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_25;
    }
    BOOL v10 = 1;
  }
LABEL_26:

  return v10;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(CSDMessagingHandle *)self->_primaryHandle hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_primaryIdentifier;
  }
  else {
    unint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_primaryAvcIdentifier hash];
  unint64_t v7 = [(CSDMessagingHandle *)self->_associatedPseudonym hash];
  NSUInteger v8 = [(NSString *)self->_conversationGroupUUIDString hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_type;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if ((v4[14] & 4) != 0)
  {
    self->_version = v4[13];
    *(unsigned char *)&self->_has |= 4u;
  }
  primaryHandle = self->_primaryHandle;
  uint64_t v7 = *((void *)v5 + 5);
  id v10 = v5;
  if (primaryHandle)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingHandle mergeFrom:](primaryHandle, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingMemberAssociationClaim setPrimaryHandle:](self, "setPrimaryHandle:");
  }
  id v5 = v10;
LABEL_9:
  if (*((unsigned char *)v5 + 56))
  {
    self->_primaryIdentifier = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 4))
  {
    -[CSDMessagingMemberAssociationClaim setPrimaryAvcIdentifier:](self, "setPrimaryAvcIdentifier:");
    id v5 = v10;
  }
  associatedPseudonym = self->_associatedPseudonym;
  uint64_t v9 = *((void *)v5 + 2);
  if (associatedPseudonym)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[CSDMessagingHandle mergeFrom:](associatedPseudonym, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[CSDMessagingMemberAssociationClaim setAssociatedPseudonym:](self, "setAssociatedPseudonym:");
  }
  id v5 = v10;
LABEL_19:
  if (*((void *)v5 + 3))
  {
    -[CSDMessagingMemberAssociationClaim setConversationGroupUUIDString:](self, "setConversationGroupUUIDString:");
    id v5 = v10;
  }
  if ((*((unsigned char *)v5 + 56) & 2) != 0)
  {
    self->_type = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (CSDMessagingHandle)primaryHandle
{
  return self->_primaryHandle;
}

- (void)setPrimaryHandle:(id)a3
{
}

- (unint64_t)primaryIdentifier
{
  return self->_primaryIdentifier;
}

- (NSString)primaryAvcIdentifier
{
  return self->_primaryAvcIdentifier;
}

- (void)setPrimaryAvcIdentifier:(id)a3
{
}

- (CSDMessagingHandle)associatedPseudonym
{
  return self->_associatedPseudonym;
}

- (void)setAssociatedPseudonym:(id)a3
{
}

- (NSString)conversationGroupUUIDString
{
  return self->_conversationGroupUUIDString;
}

- (void)setConversationGroupUUIDString:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryHandle, 0);
  objc_storeStrong((id *)&self->_primaryAvcIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationGroupUUIDString, 0);

  objc_storeStrong((id *)&self->_associatedPseudonym, 0);
}

- (id)tuAssociationForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDMessagingMemberAssociationClaim *)self primaryHandle];
  NSUInteger v6 = [v5 tuHandle];

  uint64_t v7 = [(CSDMessagingMemberAssociationClaim *)self associatedPseudonym];
  NSUInteger v8 = [v7 tuHandle];

  id v9 = [v4 isEqualToHandle:v6];
  unsigned int v10 = [v4 isEqualToHandle:v8];

  if (v9 == v10)
  {
    id v11 = 0;
  }
  else
  {
    id v11 = objc_alloc_init((Class)TUConversationMemberAssociation);
    objc_msgSend(v11, "setType:", -[CSDMessagingMemberAssociationClaim type](self, "type"));
    [v11 setPrimary:v9];
    if (v9)
    {
      [v11 setHandle:v8];
    }
    else
    {
      [v11 setHandle:v6];
      objc_msgSend(v11, "setIdentifier:", -[CSDMessagingMemberAssociationClaim primaryIdentifier](self, "primaryIdentifier"));
      v12 = [(CSDMessagingMemberAssociationClaim *)self primaryAvcIdentifier];
      id v13 = [v12 copy];
      [v11 setAvcIdentifier:v13];
    }
  }

  return v11;
}

@end