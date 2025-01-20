@interface NNMKProtoAttachmentMetadata
- (BOOL)hasContentId;
- (BOOL)hasFileName;
- (BOOL)hasFileSize;
- (BOOL)hasImageHeight;
- (BOOL)hasImageWidth;
- (BOOL)hasMimePartNumber;
- (BOOL)hasRenderOnClient;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)renderOnClient;
- (NSString)contentId;
- (NSString)fileName;
- (NSString)mimePartNumber;
- (float)imageHeight;
- (float)imageWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)fileSize;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentId:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFileSize:(unsigned int)a3;
- (void)setHasFileSize:(BOOL)a3;
- (void)setHasImageHeight:(BOOL)a3;
- (void)setHasImageWidth:(BOOL)a3;
- (void)setHasRenderOnClient:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setImageHeight:(float)a3;
- (void)setImageWidth:(float)a3;
- (void)setMimePartNumber:(id)a3;
- (void)setRenderOnClient:(BOOL)a3;
- (void)setType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoAttachmentMetadata

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (void)setFileSize:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fileSize = a3;
}

- (void)setHasFileSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFileSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRenderOnClient:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_renderOnClient = a3;
}

- (void)setHasRenderOnClient:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRenderOnClient
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setImageWidth:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_imageWidth = a3;
}

- (void)setHasImageWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasImageWidth
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setImageHeight:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_imageHeight = a3;
}

- (void)setHasImageHeight:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasImageHeight
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasMimePartNumber
{
  return self->_mimePartNumber != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoAttachmentMetadata;
  v4 = [(NNMKProtoAttachmentMetadata *)&v8 description];
  v5 = [(NNMKProtoAttachmentMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = v3;
  contentId = self->_contentId;
  if (contentId) {
    [v3 setObject:contentId forKey:@"contentId"];
  }
  fileName = self->_fileName;
  if (fileName) {
    [v5 setObject:fileName forKey:@"fileName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_fileSize];
    [v5 setObject:v12 forKey:@"fileSize"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  v13 = [NSNumber numberWithUnsignedInt:self->_type];
  [v5 setObject:v13 forKey:@"type"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  v14 = [NSNumber numberWithBool:self->_renderOnClient];
  [v5 setObject:v14 forKey:@"renderOnClient"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_19:
  *(float *)&double v4 = self->_imageWidth;
  v15 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v15 forKey:@"imageWidth"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    *(float *)&double v4 = self->_imageHeight;
    v9 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v9 forKey:@"imageHeight"];
  }
LABEL_11:
  mimePartNumber = self->_mimePartNumber;
  if (mimePartNumber) {
    [v5 setObject:mimePartNumber forKey:@"mimePartNumber"];
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoAttachmentMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_contentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_fileName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_11:
  if (self->_mimePartNumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_contentId)
  {
    objc_msgSend(v4, "setContentId:");
    id v4 = v6;
  }
  if (self->_fileName)
  {
    objc_msgSend(v6, "setFileName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_fileSize;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 12) = self->_type;
  *((unsigned char *)v4 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)v4 + 52) = self->_renderOnClient;
  *((unsigned char *)v4 + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)v4 + 8) = LODWORD(self->_imageWidth);
  *((unsigned char *)v4 + 56) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 7) = LODWORD(self->_imageHeight);
    *((unsigned char *)v4 + 56) |= 2u;
  }
LABEL_11:
  if (self->_mimePartNumber)
  {
    objc_msgSend(v6, "setMimePartNumber:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_contentId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_fileName copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_fileSize;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_type;
  *(unsigned char *)(v5 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(float *)(v5 + 32) = self->_imageWidth;
    *(unsigned char *)(v5 + 56) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(unsigned char *)(v5 + 52) = self->_renderOnClient;
  *(unsigned char *)(v5 + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(float *)(v5 + 28) = self->_imageHeight;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
LABEL_7:
  uint64_t v11 = [(NSString *)self->_mimePartNumber copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](contentId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  fileName = self->_fileName;
  if ((unint64_t)fileName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](fileName, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_fileSize != *((_DWORD *)v4 + 6)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
    {
      if (self->_renderOnClient)
      {
        if (!*((unsigned char *)v4 + 52)) {
          goto LABEL_36;
        }
        goto LABEL_24;
      }
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_24;
      }
    }
LABEL_36:
    char v8 = 0;
    goto LABEL_37;
  }
  if ((*((unsigned char *)v4 + 56) & 0x10) != 0) {
    goto LABEL_36;
  }
LABEL_24:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_imageWidth != *((float *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_imageHeight != *((float *)v4 + 7)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_36;
  }
  mimePartNumber = self->_mimePartNumber;
  if ((unint64_t)mimePartNumber | *((void *)v4 + 5)) {
    char v8 = -[NSString isEqual:](mimePartNumber, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_37:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contentId hash];
  NSUInteger v4 = [(NSString *)self->_fileName hash];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v6 = 2654435761 * self->_fileSize;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_type;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v13 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_renderOnClient;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  float imageWidth = self->_imageWidth;
  float v10 = -imageWidth;
  if (imageWidth >= 0.0) {
    float v10 = self->_imageWidth;
  }
  float v11 = floorf(v10 + 0.5);
  float v12 = (float)(v10 - v11) * 1.8447e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmodf(v11, 1.8447e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabsf(v12);
  }
LABEL_15:
  if ((has & 2) != 0)
  {
    float imageHeight = self->_imageHeight;
    float v16 = -imageHeight;
    if (imageHeight >= 0.0) {
      float v16 = self->_imageHeight;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ [(NSString *)self->_mimePartNumber hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[NNMKProtoAttachmentMetadata setContentId:](self, "setContentId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[NNMKProtoAttachmentMetadata setFileName:](self, "setFileName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if (v5)
  {
    self->_fileSize = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_type = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_renderOnClient = *((unsigned char *)v4 + 52);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_19:
  self->_float imageWidth = *((float *)v4 + 8);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_10:
    self->_float imageHeight = *((float *)v4 + 7);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_11:
  if (*((void *)v4 + 5))
  {
    -[NNMKProtoAttachmentMetadata setMimePartNumber:](self, "setMimePartNumber:");
    id v4 = v6;
  }
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (unsigned)fileSize
{
  return self->_fileSize;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)renderOnClient
{
  return self->_renderOnClient;
}

- (float)imageWidth
{
  return self->_imageWidth;
}

- (float)imageHeight
{
  return self->_imageHeight;
}

- (NSString)mimePartNumber
{
  return self->_mimePartNumber;
}

- (void)setMimePartNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimePartNumber, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
}

@end