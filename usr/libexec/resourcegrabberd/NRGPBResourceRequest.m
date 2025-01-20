@interface NRGPBResourceRequest
- (BOOL)hasBundleID;
- (BOOL)hasIconVariant;
- (BOOL)hasScreenScale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSString)bundleID;
- (float)screenScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)iconVariant;
- (int)type;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setHasIconVariant:(BOOL)a3;
- (void)setHasScreenScale:(BOOL)a3;
- (void)setIconVariant:(int)a3;
- (void)setScreenScale:(float)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRGPBResourceRequest

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setScreenScale:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_screenScale = a3;
}

- (void)setHasScreenScale:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScreenScale
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIconVariant:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_iconVariant = a3;
}

- (void)setHasIconVariant:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIconVariant
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRGPBResourceRequest;
  char v3 = [(NRGPBResourceRequest *)&v7 description];
  v4 = [(NRGPBResourceRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  v6 = +[NSNumber numberWithInt:self->_type];
  [v4 setObject:v6 forKey:@"type"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&double v7 = self->_screenScale;
    v9 = +[NSNumber numberWithFloat:v7];
    [v4 setObject:v9 forKey:@"screenScale"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = +[NSNumber numberWithInt:self->_iconVariant];
    [v4 setObject:v10 forKey:@"iconVariant"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000106B0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
}

- (unsigned)requestTypeCode
{
  return 1;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_bundleID)
  {
    id v6 = v4;
    [v4 setBundleID:];
    id v4 = v6;
  }
  *((_DWORD *)v4 + 6) = self->_type;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = LODWORD(self->_screenScale);
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_iconVariant;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  double v7 = (void *)v5[1];
  v5[1] = v6;

  *((_DWORD *)v5 + 6) = self->_type;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = LODWORD(self->_screenScale);
    *((unsigned char *)v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 4) = self->_iconVariant;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (self->_type != *((_DWORD *)v4 + 6)) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_screenScale != *((float *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_iconVariant != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
    BOOL v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleID hash];
  uint64_t type = self->_type;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float screenScale = self->_screenScale;
    float v8 = -screenScale;
    if (screenScale >= 0.0) {
      float v8 = self->_screenScale;
    }
    float v9 = floorf(v8 + 0.5);
    float v10 = (float)(v8 - v9) * 1.8447e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if (has) {
    uint64_t v11 = 2654435761 * self->_iconVariant;
  }
  else {
    uint64_t v11 = 0;
  }
  return (2654435761 * type) ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[NRGPBResourceRequest setBundleID:](self, "setBundleID:");
    id v4 = v6;
  }
  self->_uint64_t type = *((_DWORD *)v4 + 6);
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_float screenScale = *((float *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_iconVariant = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (float)screenScale
{
  return self->_screenScale;
}

- (int)iconVariant
{
  return self->_iconVariant;
}

- (void).cxx_destruct
{
}

@end