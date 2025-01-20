@interface FCCKPResponseOperationResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPResponseOperationResult

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPResponseOperationResult;
  v4 = [(FCCKPResponseOperationResult *)&v8 description];
  v5 = [(FCCKPResponseOperationResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_code];
    [v3 setObject:v4 forKey:@"code"];
  }
  error = self->_error;
  if (error)
  {
    v6 = [(FCCKPResponseOperationResultError *)error dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"error"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPResponseOperationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_code;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v7 = [(FCCKPResponseOperationResultError *)self->_error copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_code != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 2)) {
    char v6 = -[FCCKPResponseOperationResultError isEqual:](error, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_code;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(FCCKPResponseOperationResultError *)self->_error hash] ^ v2;
}

@end