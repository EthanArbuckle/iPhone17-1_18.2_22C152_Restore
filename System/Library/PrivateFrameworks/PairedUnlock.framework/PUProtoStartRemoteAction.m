@interface PUProtoStartRemoteAction
- (BOOL)hasPasscodeType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)actionID;
- (unsigned)passcodeType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionID:(unsigned int)a3;
- (void)setHasPasscodeType:(BOOL)a3;
- (void)setPasscodeType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PUProtoStartRemoteAction

- (void)setPasscodeType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_passcodeType = a3;
}

- (void)setHasPasscodeType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPasscodeType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PUProtoStartRemoteAction;
  v3 = [(PUProtoStartRemoteAction *)&v7 description];
  v4 = [(PUProtoStartRemoteAction *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithUnsignedInt:self->_actionID];
  [v3 setObject:v4 forKey:@"actionID"];

  if (*(unsigned char *)&self->_has)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_passcodeType];
    [v3 setObject:v5 forKey:@"passcodeType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PUProtoStartRemoteActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_actionID;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 3) = self->_passcodeType;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_actionID;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 3) = self->_passcodeType;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_actionID != *((_DWORD *)v4 + 2)) {
    goto LABEL_7;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_passcodeType == *((_DWORD *)v4 + 3))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_passcodeType;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 ^ (2654435761 * self->_actionID);
}

- (void)mergeFrom:(id)a3
{
  self->_actionID = *((_DWORD *)a3 + 2);
  if (*((unsigned char *)a3 + 16))
  {
    self->_passcodeType = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)actionID
{
  return self->_actionID;
}

- (void)setActionID:(unsigned int)a3
{
  self->_actionID = a3;
}

- (unsigned)passcodeType
{
  return self->_passcodeType;
}

@end