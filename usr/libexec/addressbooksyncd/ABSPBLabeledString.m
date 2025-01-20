@interface ABSPBLabeledString
- (BOOL)hasLabel;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)label;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLabel:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBLabeledString

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBLabeledString;
  v3 = [(ABSPBLabeledString *)&v7 description];
  v4 = [(ABSPBLabeledString *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  value = self->_value;
  if (value) {
    [v4 setObject:value forKey:@"value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBLabeledStringReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_label)
  {
    [v4 setLabel:];
    id v4 = v5;
  }
  if (self->_value)
  {
    [v5 setValue:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_label copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((label = self->_label, !((unint64_t)label | v4[1]))
     || -[NSString isEqual:](label, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2]) {
      unsigned __int8 v7 = -[NSString isEqual:](value, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  return [(NSString *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[ABSPBLabeledString setLabel:](self, "setLabel:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[ABSPBLabeledString setValue:](self, "setValue:");
    id v4 = v5;
  }
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end