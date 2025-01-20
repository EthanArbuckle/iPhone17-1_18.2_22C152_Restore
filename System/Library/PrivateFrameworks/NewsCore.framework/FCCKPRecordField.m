@interface FCCKPRecordField
- (BOOL)hasIdentifier;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FCCKPRecordFieldIdentifier)identifier;
- (FCCKPRecordFieldValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPRecordField

- (FCCKPRecordFieldIdentifier)identifier
{
  return self->_identifier;
}

- (FCCKPRecordFieldValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecordField;
  v4 = [(FCCKPRecordField *)&v8 description];
  v5 = [(FCCKPRecordField *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  identifier = self->_identifier;
  if (identifier)
  {
    v5 = [(FCCKPRecordFieldIdentifier *)identifier dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"identifier"];
  }
  value = self->_value;
  if (value)
  {
    v7 = [(FCCKPRecordFieldValue *)value dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"value"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordFieldReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteSubmessage();
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
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPRecordFieldIdentifier *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(FCCKPRecordFieldValue *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[FCCKPRecordFieldIdentifier isEqual:](identifier, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2]) {
      char v7 = -[FCCKPRecordFieldValue isEqual:](value, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FCCKPRecordFieldIdentifier *)self->_identifier hash];
  return [(FCCKPRecordFieldValue *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (identifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[FCCKPRecordFieldIdentifier mergeFrom:](identifier, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[FCCKPRecordField setIdentifier:](self, "setIdentifier:");
  }
  id v4 = v9;
LABEL_7:
  value = self->_value;
  uint64_t v8 = v4[2];
  if (value)
  {
    if (!v8) {
      goto LABEL_13;
    }
    value = (FCCKPRecordFieldValue *)-[FCCKPRecordFieldValue mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    value = (FCCKPRecordFieldValue *)-[FCCKPRecordField setValue:](self, "setValue:");
  }
  id v4 = v9;
LABEL_13:
  MEMORY[0x1F41817F8](value, v4);
}

- (void)setIdentifier:(id)a3
{
}

- (void)setValue:(id)a3
{
}

@end