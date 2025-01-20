@interface PPPBFeedbackMetadata
- (BOOL)hasClientBundleId;
- (BOOL)hasClientIdentifier;
- (BOOL)hasIsMapped;
- (BOOL)hasMappingId;
- (BOOL)hasUnixTimestampSec;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMapped;
- (BOOL)readFrom:(id)a3;
- (NSString)clientBundleId;
- (NSString)clientIdentifier;
- (NSString)mappingId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)unixTimestampSec;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientBundleId:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setHasIsMapped:(BOOL)a3;
- (void)setHasUnixTimestampSec:(BOOL)a3;
- (void)setIsMapped:(BOOL)a3;
- (void)setMappingId:(id)a3;
- (void)setUnixTimestampSec:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBFeedbackMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
}

- (BOOL)isMapped
{
  return self->_isMapped;
}

- (unint64_t)unixTimestampSec
{
  return self->_unixTimestampSec;
}

- (void)setMappingId:(id)a3
{
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientBundleId:(id)a3
{
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[PPPBFeedbackMetadata setClientBundleId:](self, "setClientBundleId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[PPPBFeedbackMetadata setClientIdentifier:](self, "setClientIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[PPPBFeedbackMetadata setMappingId:](self, "setMappingId:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_unixTimestampSec = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_isMapped = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientBundleId hash];
  NSUInteger v4 = [(NSString *)self->_clientIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_mappingId hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v6 = 2654435761u * self->_unixTimestampSec;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_isMapped;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  clientBundleId = self->_clientBundleId;
  if ((unint64_t)clientBundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientBundleId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](mappingId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_unixTimestampSec != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_15;
  }
  BOOL v8 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0)
    {
LABEL_15:
      BOOL v8 = 0;
      goto LABEL_16;
    }
    if (self->_isMapped)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_15;
    }
    BOOL v8 = 1;
  }
LABEL_16:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientBundleId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_mappingId copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_unixTimestampSec;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_isMapped;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_clientBundleId)
  {
    objc_msgSend(v4, "setClientBundleId:");
    id v4 = v6;
  }
  if (self->_clientIdentifier)
  {
    objc_msgSend(v6, "setClientIdentifier:");
    id v4 = v6;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v6, "setMappingId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_unixTimestampSec;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_isMapped;
    *((unsigned char *)v4 + 44) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_clientBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_clientIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_mappingId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBFeedbackMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  clientBundleId = self->_clientBundleId;
  if (clientBundleId) {
    [v3 setObject:clientBundleId forKey:@"clientBundleId"];
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v4 setObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  mappingId = self->_mappingId;
  if (mappingId) {
    [v4 setObject:mappingId forKey:@"mappingId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_unixTimestampSec];
    [v4 setObject:v9 forKey:@"unixTimestampSec"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v10 = [NSNumber numberWithBool:self->_isMapped];
    [v4 setObject:v10 forKey:@"isMapped"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBFeedbackMetadata;
  id v4 = [(PPPBFeedbackMetadata *)&v8 description];
  uint64_t v5 = [(PPPBFeedbackMetadata *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsMapped
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasIsMapped:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setIsMapped:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isMapped = a3;
}

- (BOOL)hasUnixTimestampSec
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasUnixTimestampSec:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setUnixTimestampSec:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unixTimestampSec = a3;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (BOOL)hasClientBundleId
{
  return self->_clientBundleId != 0;
}

@end