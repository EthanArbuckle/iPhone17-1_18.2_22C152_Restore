@interface ICIAMSerialCheckResponse
- (BOOL)hasCommandSerialNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)commandSerialNumber;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCommandSerialNumber:(int64_t)a3;
- (void)setHasCommandSerialNumber:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMSerialCheckResponse

- (int64_t)commandSerialNumber
{
  return self->_commandSerialNumber;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    self->_commandSerialNumber = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_commandSerialNumber;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_commandSerialNumber == *((void *)v4 + 1))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = self->_commandSerialNumber;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_commandSerialNumber;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMSerialCheckResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_commandSerialNumber];
    [v3 setObject:v4 forKey:@"commandSerialNumber"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMSerialCheckResponse;
  id v4 = [(ICIAMSerialCheckResponse *)&v8 description];
  BOOL v5 = [(ICIAMSerialCheckResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCommandSerialNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCommandSerialNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCommandSerialNumber:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_commandSerialNumber = a3;
}

@end