@interface PKProtobufPaymentInstrumentThumbnailRequest
- (BOOL)hasHeight;
- (BOOL)hasManifestHash;
- (BOOL)hasPassIdentifier;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSString)manifestHash;
- (NSString)passIdentifier;
- (double)height;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(double)a3;
- (void)setManifestHash:(id)a3;
- (void)setPassIdentifier:(id)a3;
- (void)setWidth:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentInstrumentThumbnailRequest

- (BOOL)hasPassIdentifier
{
  return self->_passIdentifier != 0;
}

- (BOOL)hasManifestHash
{
  return self->_manifestHash != 0;
}

- (void)setWidth:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHeight:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentInstrumentThumbnailRequest;
  v4 = [(PKProtobufPaymentInstrumentThumbnailRequest *)&v8 description];
  v5 = [(PKProtobufPaymentInstrumentThumbnailRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  passIdentifier = self->_passIdentifier;
  if (passIdentifier) {
    [v3 setObject:passIdentifier forKey:@"passIdentifier"];
  }
  manifestHash = self->_manifestHash;
  if (manifestHash) {
    [v4 setObject:manifestHash forKey:@"manifestHash"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_width];
    [v4 setObject:v8 forKey:@"width"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_height];
    [v4 setObject:v9 forKey:@"height"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentInstrumentThumbnailRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_passIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_manifestHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (unsigned)requestTypeCode
{
  return 7;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_passIdentifier)
  {
    objc_msgSend(v4, "setPassIdentifier:");
    id v4 = v6;
  }
  if (self->_manifestHash)
  {
    objc_msgSend(v6, "setManifestHash:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_width;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_height;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_manifestHash copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_width;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_height;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  passIdentifier = self->_passIdentifier;
  if ((unint64_t)passIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](passIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  manifestHash = self->_manifestHash;
  if ((unint64_t)manifestHash | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](manifestHash, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_width != *((double *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_height != *((double *)v4 + 1)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_manifestHash hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double width = self->_width;
    double v8 = -width;
    if (width >= 0.0) {
      double v8 = self->_width;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if (has)
  {
    double height = self->_height;
    double v13 = -height;
    if (height >= 0.0) {
      double v13 = self->_height;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  unint64_t v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[PKProtobufPaymentInstrumentThumbnailRequest setPassIdentifier:](self, "setPassIdentifier:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[PKProtobufPaymentInstrumentThumbnailRequest setManifestHash:](self, "setManifestHash:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_double width = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if (v5)
  {
    self->_double height = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void)setPassIdentifier:(id)a3
{
}

- (NSString)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
}

@end