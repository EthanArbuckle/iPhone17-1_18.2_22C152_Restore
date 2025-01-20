@interface CSDMessagingConversationParticipantAssociation
+ (id)participantAssociationWithTUConversationParticipantAssociation:(id)a3;
- (BOOL)hasAvcIdentifier;
- (BOOL)hasIdentifier;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)avcIdentifier;
- (TUConversationParticipantAssociation)tuConversationParticipantAssociation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvcIdentifier:(id)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationParticipantAssociation

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIdentifier:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAvcIdentifier
{
  return self->_avcIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationParticipantAssociation;
  char v3 = [(CSDMessagingConversationParticipantAssociation *)&v7 description];
  v4 = [(CSDMessagingConversationParticipantAssociation *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = +[NSNumber numberWithUnsignedLongLong:self->_identifier];
    [v3 setObject:v6 forKey:@"identifier"];
  }
  avcIdentifier = self->_avcIdentifier;
  if (avcIdentifier) {
    [v3 setObject:avcIdentifier forKey:@"avcIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000A020((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_avcIdentifier)
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
    v4[6] = self->_version;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_identifier;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  if (self->_avcIdentifier)
  {
    id v6 = v4;
    objc_msgSend(v4, "setAvcIdentifier:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_version;
    *((unsigned char *)v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = self->_identifier;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  id v8 = [(NSString *)self->_avcIdentifier copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_14:
    unsigned __int8 v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_identifier != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_14;
  }
  avcIdentifier = self->_avcIdentifier;
  if ((unint64_t)avcIdentifier | *((void *)v4 + 2)) {
    unsigned __int8 v6 = -[NSString isEqual:](avcIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_avcIdentifier hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_identifier;
  return v3 ^ v2 ^ [(NSString *)self->_avcIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_identifier = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[CSDMessagingConversationParticipantAssociation setAvcIdentifier:](self, "setAvcIdentifier:");
    id v4 = v6;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSString)avcIdentifier
{
  return self->_avcIdentifier;
}

- (void)setAvcIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)participantAssociationWithTUConversationParticipantAssociation:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(CSDMessagingConversationParticipantAssociation);
    -[CSDMessagingConversationParticipantAssociation setIdentifier:](v4, "setIdentifier:", [v3 identifier]);
    char v5 = [v3 avcIdentifier];

    [(CSDMessagingConversationParticipantAssociation *)v4 setAvcIdentifier:v5];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (TUConversationParticipantAssociation)tuConversationParticipantAssociation
{
  if ([(CSDMessagingConversationParticipantAssociation *)self hasIdentifier])
  {
    id v3 = objc_alloc_init((Class)TUConversationParticipantAssociation);
    objc_msgSend(v3, "setIdentifier:", -[CSDMessagingConversationParticipantAssociation identifier](self, "identifier"));
    id v4 = [(CSDMessagingConversationParticipantAssociation *)self avcIdentifier];
    [v3 setAvcIdentifier:v4];
  }
  else
  {
    id v3 = 0;
  }

  return (TUConversationParticipantAssociation *)v3;
}

@end