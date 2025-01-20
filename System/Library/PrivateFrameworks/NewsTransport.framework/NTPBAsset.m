@interface NTPBAsset
- (BOOL)hasError;
- (BOOL)hasSize;
- (BOOL)hasWrappingKeyID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)wrappingKeyID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)error;
- (unint64_t)hash;
- (unsigned)size;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setError:(int)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setSize:(unsigned int)a3;
- (void)setWrappingKeyID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAsset

- (BOOL)hasSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (NSData)wrappingKeyID
{
  return self->_wrappingKeyID;
}

- (void)dealloc
{
  [(NTPBAsset *)self setWrappingKeyID:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBAsset;
  [(NTPBAsset *)&v3 dealloc];
}

- (BOOL)hasWrappingKeyID
{
  return self->_wrappingKeyID != 0;
}

- (int)error
{
  if (*(unsigned char *)&self->_has) {
    return self->_error;
  }
  else {
    return 0;
  }
}

- (void)setError:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasError
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSize:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBAsset;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBAsset description](&v3, sel_description), -[NTPBAsset dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  wrappingKeyID = self->_wrappingKeyID;
  if (wrappingKeyID) {
    [v3 setObject:wrappingKeyID forKey:@"wrapping_key_ID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_error), @"error");
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_size), @"size");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_wrappingKeyID) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 16) = [(NSData *)self->_wrappingKeyID copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_error;
    *(unsigned char *)(v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_size;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    wrappingKeyID = self->_wrappingKeyID;
    if (!((unint64_t)wrappingKeyID | *((void *)a3 + 2))
      || (int v5 = -[NSData isEqual:](wrappingKeyID, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_error != *((_DWORD *)a3 + 2)) {
          goto LABEL_13;
        }
      }
      else if (*((unsigned char *)a3 + 24))
      {
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 2) == 0;
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_size != *((_DWORD *)a3 + 3)) {
          goto LABEL_13;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_wrappingKeyID hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_error;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_size;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[NTPBAsset setWrappingKeyID:](self, "setWrappingKeyID:");
  }
  char v5 = *((unsigned char *)a3 + 24);
  if (v5)
  {
    self->_error = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_size = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (void)setWrappingKeyID:(id)a3
{
}

- (unsigned)size
{
  return self->_size;
}

@end