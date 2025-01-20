@interface FCCKPResponseOperationResultErrorClient
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPResponseOperationResultErrorClient

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPResponseOperationResultErrorClient;
  v4 = [(FCCKPResponseOperationResultErrorClient *)&v8 description];
  v5 = [(FCCKPResponseOperationResultErrorClient *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  oplockFailure = self->_oplockFailure;
  if (oplockFailure)
  {
    v6 = [(FCCKPOplockFailure *)oplockFailure dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"oplockFailure"];
  }
  uniqueFieldFailure = self->_uniqueFieldFailure;
  if (uniqueFieldFailure)
  {
    objc_super v8 = [(FCCKPUniqueFieldFailure *)uniqueFieldFailure dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"uniqueFieldFailure"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPResponseOperationResultErrorClientReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_oplockFailure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_uniqueFieldFailure)
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
    *(_DWORD *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(FCCKPOplockFailure *)self->_oplockFailure copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = [(FCCKPUniqueFieldFailure *)self->_uniqueFieldFailure copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  oplockFailure = self->_oplockFailure;
  if ((unint64_t)oplockFailure | *((void *)v4 + 1)
    && !-[FCCKPOplockFailure isEqual:](oplockFailure, "isEqual:"))
  {
    goto LABEL_11;
  }
  uniqueFieldFailure = self->_uniqueFieldFailure;
  if ((unint64_t)uniqueFieldFailure | *((void *)v4 + 3)) {
    char v7 = -[FCCKPUniqueFieldFailure isEqual:](uniqueFieldFailure, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(FCCKPOplockFailure *)self->_oplockFailure hash] ^ v3;
  return v4 ^ [(FCCKPUniqueFieldFailure *)self->_uniqueFieldFailure hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueFieldFailure, 0);
  objc_storeStrong((id *)&self->_oplockFailure, 0);
}

@end