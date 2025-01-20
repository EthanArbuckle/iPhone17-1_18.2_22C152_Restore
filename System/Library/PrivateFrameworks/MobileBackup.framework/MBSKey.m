@interface MBSKey
- (BOOL)hasKeyData;
- (BOOL)hasKeyID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)keyData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)keyID;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasKeyID:(BOOL)a3;
- (void)setKeyData:(id)a3;
- (void)setKeyID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSKey

- (void)dealloc
{
  [(MBSKey *)self setKeyData:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSKey;
  [(MBSKey *)&v3 dealloc];
}

- (void)setKeyID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_keyID = a3;
}

- (void)setHasKeyID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeyID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasKeyData
{
  return self->_keyData != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSKey;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSKey *)&v3 description], [(MBSKey *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_keyID), @"keyID");
  }
  keyData = self->_keyData;
  if (keyData) {
    [v3 setObject:keyData forKey:@"keyData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MBSKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_keyData)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_keyID;
    *((unsigned char *)a3 + 20) |= 1u;
  }
  keyData = self->_keyData;
  if (keyData) {
    [a3 setKeyData:keyData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_keyID;
    *((unsigned char *)v5 + 20) |= 1u;
  }

  v6[1] = [(NSData *)self->_keyData copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_keyID != *((_DWORD *)a3 + 4)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)a3 + 20))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    keyData = self->_keyData;
    if ((unint64_t)keyData | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSData isEqual:](keyData, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_keyID;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSData *)self->_keyData hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 20))
  {
    self->_keyID = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 1)) {
    -[MBSKey setKeyData:](self, "setKeyData:");
  }
}

- (unsigned)keyID
{
  return self->_keyID;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

@end