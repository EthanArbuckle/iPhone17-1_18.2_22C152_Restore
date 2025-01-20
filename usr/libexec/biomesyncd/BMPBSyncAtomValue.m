@interface BMPBSyncAtomValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSyncAtomValue

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BMPBSyncAtomValue;
  v3 = [(BMPBSyncAtomValue *)&v7 description];
  v4 = [(BMPBSyncAtomValue *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 5)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v5 = off_10006D168[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  value = self->_value;
  if (value)
  {
    objc_super v7 = [(BMPBStoreEventAtomValue *)value dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"value"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100019014((uint64_t)self, (uint64_t)a3);
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
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_type;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  id v7 = [(BMPBStoreEventAtomValue *)self->_value copyWithZone:a3];
  v8 = (void *)v6[2];
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 2)) {
    unsigned __int8 v6 = -[BMPBStoreEventAtomValue isEqual:](value, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_type;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(BMPBStoreEventAtomValue *)self->_value hash] ^ v2;
}

- (void).cxx_destruct
{
}

@end