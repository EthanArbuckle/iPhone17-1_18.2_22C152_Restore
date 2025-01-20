@interface FCCKPIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)setName:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPIdentifier

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)setName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPIdentifier;
  id v4 = [(FCCKPIdentifier *)&v8 description];
  id v5 = [(FCCKPIdentifier *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_type];
    [v4 setObject:v6 forKey:@"type"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_type == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  NSUInteger v3 = a2;
  if (a1)
  {
    uint64_t v4 = (void *)v3[1];
    if (v4)
    {
      uint64_t v5 = v3;
      objc_storeStrong((id *)(a1 + 8), v4);
      NSUInteger v3 = v5;
    }
    if (*((unsigned char *)v3 + 20))
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(unsigned char *)(a1 + 20) |= 1u;
    }
  }
}

@end