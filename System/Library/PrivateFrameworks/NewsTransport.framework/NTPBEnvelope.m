@interface NTPBEnvelope
- (BOOL)hasContentTypeMinorVersion;
- (BOOL)hasContentTypePatchVersion;
- (BOOL)hasIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)content;
- (NSData)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)contentType;
- (int)contentTypeMinorVersion;
- (int)contentTypePatchVersion;
- (int)contentTypeVersion;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setContent:(id)a3;
- (void)setContentType:(int)a3;
- (void)setContentTypeMinorVersion:(int)a3;
- (void)setContentTypePatchVersion:(int)a3;
- (void)setContentTypeVersion:(int)a3;
- (void)setHasContentTypeMinorVersion:(BOOL)a3;
- (void)setHasContentTypePatchVersion:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBEnvelope

- (void)setContentTypeMinorVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contentTypeMinorVersion = a3;
}

- (void)setHasContentTypeMinorVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentTypeMinorVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setContentTypePatchVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_contentTypePatchVersion = a3;
}

- (void)setHasContentTypePatchVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContentTypePatchVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBEnvelope;
  v4 = [(NTPBEnvelope *)&v8 description];
  v5 = [(NTPBEnvelope *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithInt:self->_contentTypeVersion];
  [v3 setObject:v4 forKey:@"content_type_version"];

  v5 = [NSNumber numberWithInt:self->_contentType];
  [v3 setObject:v5 forKey:@"content_type"];

  content = self->_content;
  if (content) {
    [v3 setObject:content forKey:@"content"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_contentTypeMinorVersion];
    [v3 setObject:v8 forKey:@"content_type_minor_version"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_contentTypePatchVersion];
    [v3 setObject:v9 forKey:@"content_type_patch_version"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEnvelopeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDataField();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v5 = v6;
  if (self->_identifier)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 28) = self->_contentTypeVersion;
  *(_DWORD *)(v5 + 16) = self->_contentType;
  uint64_t v6 = [(NSData *)self->_content copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 20) = self->_contentTypeMinorVersion;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_contentTypePatchVersion;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v9 = [(NSData *)self->_identifier copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (self->_contentTypeVersion != *((_DWORD *)v4 + 7)) {
    goto LABEL_18;
  }
  if (self->_contentType != *((_DWORD *)v4 + 4)) {
    goto LABEL_18;
  }
  content = self->_content;
  if ((unint64_t)content | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](content, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_contentTypeMinorVersion != *((_DWORD *)v4 + 5)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_18:
    char v7 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_contentTypePatchVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_18;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4)) {
    char v7 = -[NSData isEqual:](identifier, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_19:

  return v7;
}

- (unint64_t)hash
{
  uint64_t contentTypeVersion = self->_contentTypeVersion;
  uint64_t contentType = self->_contentType;
  uint64_t v5 = [(NSData *)self->_content hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_contentTypeMinorVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return (2654435761 * contentType) ^ (2654435761 * contentTypeVersion) ^ v5 ^ v6 ^ v7 ^ [(NSData *)self->_identifier hash];
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_contentTypePatchVersion;
  return (2654435761 * contentType) ^ (2654435761 * contentTypeVersion) ^ v5 ^ v6 ^ v7 ^ [(NSData *)self->_identifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t contentTypeVersion = v4[7];
  self->_uint64_t contentType = v4[4];
  uint64_t v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[NTPBEnvelope setContent:](self, "setContent:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_contentTypeMinorVersion = v4[5];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_contentTypePatchVersion = v4[6];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBEnvelope setIdentifier:](self, "setIdentifier:");
    id v4 = v6;
  }
}

- (int)contentTypeVersion
{
  return self->_contentTypeVersion;
}

- (void)setContentTypeVersion:(int)a3
{
  self->_uint64_t contentTypeVersion = a3;
}

- (int)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int)a3
{
  self->_uint64_t contentType = a3;
}

- (NSData)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (int)contentTypeMinorVersion
{
  return self->_contentTypeMinorVersion;
}

- (int)contentTypePatchVersion
{
  return self->_contentTypePatchVersion;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end