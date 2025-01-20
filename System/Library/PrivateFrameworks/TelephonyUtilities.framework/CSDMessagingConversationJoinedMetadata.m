@interface CSDMessagingConversationJoinedMetadata
- (BOOL)hasAudioRouteUniqueIdentifier;
- (BOOL)hasSender;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationParticipant)sender;
- (NSString)audioRouteUniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioRouteUniqueIdentifier:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationJoinedMetadata

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (BOOL)hasAudioRouteUniqueIdentifier
{
  return self->_audioRouteUniqueIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationJoinedMetadata;
  v3 = [(CSDMessagingConversationJoinedMetadata *)&v7 description];
  v4 = [(CSDMessagingConversationJoinedMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  sender = self->_sender;
  if (sender)
  {
    v6 = [(CSDMessagingConversationParticipant *)sender dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"sender"];
  }
  audioRouteUniqueIdentifier = self->_audioRouteUniqueIdentifier;
  if (audioRouteUniqueIdentifier) {
    [v3 setObject:audioRouteUniqueIdentifier forKey:@"audioRouteUniqueIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100056AE4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_sender)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_audioRouteUniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v5 = v4;
  if (self->_sender)
  {
    objc_msgSend(v4, "setSender:");
    id v4 = v5;
  }
  if (self->_audioRouteUniqueIdentifier)
  {
    objc_msgSend(v5, "setAudioRouteUniqueIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_version;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  id v7 = [(CSDMessagingConversationParticipant *)self->_sender copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(NSString *)self->_audioRouteUniqueIdentifier copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  sender = self->_sender;
  if ((unint64_t)sender | *((void *)v4 + 2)
    && !-[CSDMessagingConversationParticipant isEqual:](sender, "isEqual:"))
  {
    goto LABEL_11;
  }
  audioRouteUniqueIdentifier = self->_audioRouteUniqueIdentifier;
  if ((unint64_t)audioRouteUniqueIdentifier | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[NSString isEqual:](audioRouteUniqueIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(CSDMessagingConversationParticipant *)self->_sender hash] ^ v3;
  return v4 ^ [(NSString *)self->_audioRouteUniqueIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 28))
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  sender = self->_sender;
  uint64_t v7 = v5[2];
  v8 = v5;
  if (sender)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingConversationParticipant mergeFrom:](sender, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingConversationJoinedMetadata setSender:](self, "setSender:");
  }
  id v5 = v8;
LABEL_9:
  if (v5[1])
  {
    [(CSDMessagingConversationJoinedMetadata *)self setAudioRouteUniqueIdentifier:"setAudioRouteUniqueIdentifier:"];
    id v5 = v8;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (CSDMessagingConversationParticipant)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)audioRouteUniqueIdentifier
{
  return self->_audioRouteUniqueIdentifier;
}

- (void)setAudioRouteUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_audioRouteUniqueIdentifier, 0);
}

@end