@interface DecryptedParticipantPayload
- (BOOL)hasChannelIdentifier;
- (BOOL)hasClientPayload;
- (BOOL)hasPresenceIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)hasTokenUri;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)clientPayload;
- (NSString)channelIdentifier;
- (NSString)presenceIdentifier;
- (NSString)tokenUri;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelIdentifier:(id)a3;
- (void)setClientPayload:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPresenceIdentifier:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTokenUri:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DecryptedParticipantPayload

- (BOOL)hasTokenUri
{
  return self->_tokenUri != 0;
}

- (BOOL)hasPresenceIdentifier
{
  return self->_presenceIdentifier != 0;
}

- (BOOL)hasChannelIdentifier
{
  return self->_channelIdentifier != 0;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasClientPayload
{
  return self->_clientPayload != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DecryptedParticipantPayload;
  v4 = [(DecryptedParticipantPayload *)&v8 description];
  v5 = [(DecryptedParticipantPayload *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  tokenUri = self->_tokenUri;
  if (tokenUri) {
    [v3 setObject:tokenUri forKey:@"token_uri"];
  }
  presenceIdentifier = self->_presenceIdentifier;
  if (presenceIdentifier) {
    [v4 setObject:presenceIdentifier forKey:@"presence_identifier"];
  }
  channelIdentifier = self->_channelIdentifier;
  if (channelIdentifier) {
    [v4 setObject:channelIdentifier forKey:@"channel_identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v4 setObject:v8 forKey:@"timestamp"];
  }
  clientPayload = self->_clientPayload;
  if (clientPayload) {
    [v4 setObject:clientPayload forKey:@"client_payload"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return DecryptedParticipantPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tokenUri)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_presenceIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_channelIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_clientPayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tokenUri)
  {
    objc_msgSend(v4, "setTokenUri:");
    id v4 = v5;
  }
  if (self->_presenceIdentifier)
  {
    objc_msgSend(v5, "setPresenceIdentifier:");
    id v4 = v5;
  }
  if (self->_channelIdentifier)
  {
    objc_msgSend(v5, "setChannelIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_timestamp;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_clientPayload)
  {
    objc_msgSend(v5, "setClientPayload:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_tokenUri copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_presenceIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_channelIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v12 = [(NSData *)self->_clientPayload copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  tokenUri = self->_tokenUri;
  if ((unint64_t)tokenUri | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](tokenUri, "isEqual:")) {
      goto LABEL_15;
    }
  }
  presenceIdentifier = self->_presenceIdentifier;
  if ((unint64_t)presenceIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](presenceIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  channelIdentifier = self->_channelIdentifier;
  if ((unint64_t)channelIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](channelIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  clientPayload = self->_clientPayload;
  if ((unint64_t)clientPayload | *((void *)v4 + 3)) {
    char v9 = -[NSData isEqual:](clientPayload, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tokenUri hash];
  NSUInteger v4 = [(NSString *)self->_presenceIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_channelIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSData *)self->_clientPayload hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unint64_t *)a3;
  NSUInteger v5 = v4;
  if (v4[5])
  {
    -[DecryptedParticipantPayload setTokenUri:](self, "setTokenUri:");
    NSUInteger v4 = v5;
  }
  if (v4[4])
  {
    -[DecryptedParticipantPayload setPresenceIdentifier:](self, "setPresenceIdentifier:");
    NSUInteger v4 = v5;
  }
  if (v4[2])
  {
    -[DecryptedParticipantPayload setChannelIdentifier:](self, "setChannelIdentifier:");
    NSUInteger v4 = v5;
  }
  if (v4[6])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[3])
  {
    -[DecryptedParticipantPayload setClientPayload:](self, "setClientPayload:");
    NSUInteger v4 = v5;
  }
}

- (NSString)tokenUri
{
  return self->_tokenUri;
}

- (void)setTokenUri:(id)a3
{
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (void)setPresenceIdentifier:(id)a3
{
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (void)setChannelIdentifier:(id)a3
{
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)clientPayload
{
  return self->_clientPayload;
}

- (void)setClientPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenUri, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientPayload, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end