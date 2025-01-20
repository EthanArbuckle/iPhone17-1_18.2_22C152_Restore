@interface PUProtoPasscodePolicy
- (BOOL)hasMinimumLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)modificationAllowed;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)minimumLength;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMinimumLength:(BOOL)a3;
- (void)setMinimumLength:(unsigned int)a3;
- (void)setModificationAllowed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PUProtoPasscodePolicy

- (void)setMinimumLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minimumLength = a3;
}

- (void)setHasMinimumLength:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PUProtoPasscodePolicy;
  v3 = [(PUProtoPasscodePolicy *)&v7 description];
  v4 = [(PUProtoPasscodePolicy *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithBool:self->_modificationAllowed];
  [v3 setObject:v4 forKey:@"modificationAllowed"];

  if (*(unsigned char *)&self->_has)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_minimumLength];
    [v3 setObject:v5 forKey:@"minimumLength"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PUProtoPasscodePolicyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 12) = self->_modificationAllowed;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_minimumLength;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 12) = self->_modificationAllowed;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_minimumLength;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  if (self->_modificationAllowed)
  {
    if (!*((unsigned char *)v4 + 12)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 12))
  {
LABEL_10:
    BOOL v5 = 0;
    goto LABEL_11;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_minimumLength != *((_DWORD *)v4 + 2)) {
      goto LABEL_10;
    }
    BOOL v5 = 1;
  }
LABEL_11:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_minimumLength;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 ^ (2654435761 * self->_modificationAllowed);
}

- (void)mergeFrom:(id)a3
{
  self->_modificationAllowed = *((unsigned char *)a3 + 12);
  if (*((unsigned char *)a3 + 16))
  {
    self->_minimumLength = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)modificationAllowed
{
  return self->_modificationAllowed;
}

- (void)setModificationAllowed:(BOOL)a3
{
  self->_modificationAllowed = a3;
}

- (unsigned)minimumLength
{
  return self->_minimumLength;
}

@end