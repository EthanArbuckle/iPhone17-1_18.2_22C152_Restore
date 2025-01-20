@interface PBBProtoDidEndPasscodeCreation
- (BOOL)hasIsLong;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLong;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsLong:(BOOL)a3;
- (void)setIsLong:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoDidEndPasscodeCreation

- (void)setIsLong:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isLong = a3;
}

- (void)setHasIsLong:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsLong
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoDidEndPasscodeCreation;
  v4 = [(PBBProtoDidEndPasscodeCreation *)&v8 description];
  v5 = [(PBBProtoDidEndPasscodeCreation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithBool:self->_success];
  [v3 setObject:v4 forKey:@"success"];

  if (*(unsigned char *)&self->_has)
  {
    v5 = [NSNumber numberWithBool:self->_isLong];
    [v3 setObject:v5 forKey:@"isLong"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoDidEndPasscodeCreationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 9) = self->_success;
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)a3 + 8) = self->_isLong;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 9) = self->_success;
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)result + 8) = self->_isLong;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  if (self->_success)
  {
    if (!v4[9]) {
      goto LABEL_8;
    }
  }
  else if (v4[9])
  {
    goto LABEL_8;
  }
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (v4[12])
    {
      if (self->_isLong)
      {
        if (!v4[8]) {
          goto LABEL_8;
        }
      }
      else if (v4[8])
      {
        goto LABEL_8;
      }
      BOOL v5 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v5 = 0;
  }
LABEL_9:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_isLong;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 ^ (2654435761 * self->_success);
}

- (void)mergeFrom:(id)a3
{
  self->_success = *((unsigned char *)a3 + 9);
  if (*((unsigned char *)a3 + 12))
  {
    self->_isLong = *((unsigned char *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)isLong
{
  return self->_isLong;
}

@end