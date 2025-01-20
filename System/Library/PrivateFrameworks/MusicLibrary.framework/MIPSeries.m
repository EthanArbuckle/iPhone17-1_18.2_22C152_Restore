@interface MIPSeries
- (BOOL)hasName;
- (BOOL)hasSortName;
- (BOOL)hasStoreId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (NSString)sortName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)storeId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStoreId:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSortName:(id)a3;
- (void)setStoreId:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPSeries

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setSortName:(id)a3
{
}

- (NSString)sortName
{
  return self->_sortName;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)storeId
{
  return self->_storeId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[4])
  {
    self->_storeId = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  v5 = v4;
  if (v4[2])
  {
    -[MIPSeries setName:](self, "setName:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[MIPSeries setSortName:](self, "setSortName:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_storeId;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  return v4 ^ [(NSString *)self->_sortName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_storeId != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 2) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_11;
  }
  sortName = self->_sortName;
  if ((unint64_t)sortName | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](sortName, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_storeId;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_name copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_sortName copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_storeId;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_sortName)
  {
    objc_msgSend(v5, "setSortName:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sortName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPSeriesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_storeId];
    [v3 setObject:v4 forKey:@"storeId"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  sortName = self->_sortName;
  if (sortName) {
    [v3 setObject:sortName forKey:@"sortName"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPSeries;
  id v4 = [(MIPSeries *)&v8 description];
  id v5 = [(MIPSeries *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSortName
{
  return self->_sortName != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasStoreId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasStoreId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setStoreId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_storeId = a3;
}

@end