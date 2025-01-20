@interface PKProtobufPaymentInstrumentThumbnailResponse
- (BOOL)hasManifestHash;
- (BOOL)hasStatus;
- (BOOL)hasThumbnailImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)thumbnailImage;
- (NSString)manifestHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setManifestHash:(id)a3;
- (void)setStatus:(int)a3;
- (void)setThumbnailImage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentInstrumentThumbnailResponse

- (BOOL)hasThumbnailImage
{
  return self->_thumbnailImage != 0;
}

- (int)status
{
  if (*(unsigned char *)&self->_has) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E56F0A18[a3];
  }
  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_FOUND"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TOO_LARGE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasManifestHash
{
  return self->_manifestHash != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentInstrumentThumbnailResponse;
  int v4 = [(PKProtobufPaymentInstrumentThumbnailResponse *)&v8 description];
  v5 = [(PKProtobufPaymentInstrumentThumbnailResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage) {
    [v3 setObject:thumbnailImage forKey:@"thumbnailImage"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t status = self->_status;
    if (status >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E56F0A18[status];
    }
    [v4 setObject:v7 forKey:@"status"];
  }
  manifestHash = self->_manifestHash;
  if (manifestHash) {
    [v4 setObject:manifestHash forKey:@"manifestHash"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentInstrumentThumbnailResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_thumbnailImage)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_manifestHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_thumbnailImage)
  {
    objc_msgSend(v4, "setThumbnailImage:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_status;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_manifestHash)
  {
    objc_msgSend(v5, "setManifestHash:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_thumbnailImage copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_status;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_manifestHash copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  thumbnailImage = self->_thumbnailImage;
  if ((unint64_t)thumbnailImage | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](thumbnailImage, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_status != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  manifestHash = self->_manifestHash;
  if ((unint64_t)manifestHash | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](manifestHash, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_thumbnailImage hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_status;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(NSString *)self->_manifestHash hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[PKProtobufPaymentInstrumentThumbnailResponse setThumbnailImage:](self, "setThumbnailImage:");
    uint64_t v4 = v5;
  }
  if (v4[8])
  {
    self->_uint64_t status = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[PKProtobufPaymentInstrumentThumbnailResponse setManifestHash:](self, "setManifestHash:");
    uint64_t v4 = v5;
  }
}

- (NSData)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
}

- (NSString)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
}

@end