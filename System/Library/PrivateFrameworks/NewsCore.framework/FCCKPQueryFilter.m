@interface FCCKPQueryFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setFieldName:(uint64_t)a1;
- (void)setFieldValue:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPQueryFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValue, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fieldName)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_fieldValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)setFieldValue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setFieldName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPQueryFilter;
  id v4 = [(FCCKPQueryFilter *)&v8 description];
  id v5 = [(FCCKPQueryFilter *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  fieldName = self->_fieldName;
  if (fieldName)
  {
    id v5 = [(FCCKPRecordFieldIdentifier *)fieldName dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"fieldName"];
  }
  fieldValue = self->_fieldValue;
  if (fieldValue)
  {
    v7 = [(FCCKPRecordFieldValue *)fieldValue dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"fieldValue"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v8 forKey:@"type"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPQueryFilterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPRecordFieldIdentifier *)self->_fieldName copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  id v8 = [(FCCKPRecordFieldValue *)self->_fieldValue copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  fieldName = self->_fieldName;
  if ((unint64_t)fieldName | *((void *)v4 + 1))
  {
    if (!-[FCCKPRecordFieldIdentifier isEqual:](fieldName, "isEqual:")) {
      goto LABEL_10;
    }
  }
  fieldValue = self->_fieldValue;
  if ((unint64_t)fieldValue | *((void *)v4 + 2))
  {
    if (!-[FCCKPRecordFieldValue isEqual:](fieldValue, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_type == *((_DWORD *)v4 + 6))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FCCKPRecordFieldIdentifier *)self->_fieldName hash];
  unint64_t v4 = [(FCCKPRecordFieldValue *)self->_fieldValue hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

@end