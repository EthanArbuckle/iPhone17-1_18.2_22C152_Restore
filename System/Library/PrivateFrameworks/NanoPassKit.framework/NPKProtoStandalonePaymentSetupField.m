@interface NPKProtoStandalonePaymentSetupField
- (BOOL)hasCurrentValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)currentValue;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldTypeAsString:(int)a3;
- (int)StringAsFieldType:(id)a3;
- (int)fieldType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setFieldType:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentSetupField

- (id)fieldTypeAsString:(int)a3
{
  if (a3 > 129)
  {
    switch(a3)
    {
      case 130:
        v4 = @"Label";
        break;
      case 140:
        v4 = @"Footer";
        break;
      case 150:
        v4 = @"Picker";
        break;
      default:
LABEL_26:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        v4 = @"Unknown";
        break;
      case 'n':
        v4 = @"Text";
        break;
      case 'x':
        v4 = @"Date";
        return v4;
      default:
        goto LABEL_26;
    }
  }
  return v4;
}

- (int)StringAsFieldType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"Text"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"Date"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"Label"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"Footer"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"Picker"])
  {
    int v4 = 150;
  }
  else
  {
    int v4 = 100;
  }

  return v4;
}

- (BOOL)hasCurrentValue
{
  return self->_currentValue != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentSetupField;
  int v4 = [(NPKProtoStandalonePaymentSetupField *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentSetupField *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  int fieldType = self->_fieldType;
  if (fieldType > 129)
  {
    switch(fieldType)
    {
      case 130:
        v7 = @"Label";
        goto LABEL_17;
      case 140:
        v7 = @"Footer";
        goto LABEL_17;
      case 150:
        v7 = @"Picker";
        goto LABEL_17;
    }
  }
  else
  {
    switch(fieldType)
    {
      case 'd':
        v7 = @"Unknown";
        goto LABEL_17;
      case 'n':
        v7 = @"Text";
        goto LABEL_17;
      case 'x':
        v7 = @"Date";
        goto LABEL_17;
    }
  }
  objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fieldType);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  [v4 setObject:v7 forKey:@"fieldType"];

  currentValue = self->_currentValue;
  if (currentValue) {
    [v4 setObject:currentValue forKey:@"currentValue"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentSetupFieldReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_identifier) {
    -[NPKProtoStandalonePaymentSetupField writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (self->_currentValue) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setIdentifier:self->_identifier];
  id v4 = v5;
  v5[4] = self->_fieldType;
  if (self->_currentValue)
  {
    objc_msgSend(v5, "setCurrentValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(_DWORD *)(v5 + 16) = self->_fieldType;
  uint64_t v8 = [(NSString *)self->_currentValue copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[3]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && self->_fieldType == *((_DWORD *)v4 + 4))
  {
    currentValue = self->_currentValue;
    if ((unint64_t)currentValue | v4[1]) {
      char v7 = -[NSString isEqual:](currentValue, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t v4 = 2654435761 * self->_fieldType;
  return v4 ^ v3 ^ [(NSString *)self->_currentValue hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[NPKProtoStandalonePaymentSetupField setIdentifier:](self, "setIdentifier:");
    uint64_t v4 = v5;
  }
  self->_int fieldType = v4[4];
  if (*((void *)v4 + 1))
  {
    -[NPKProtoStandalonePaymentSetupField setCurrentValue:](self, "setCurrentValue:");
    uint64_t v4 = v5;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(int)a3
{
  self->_int fieldType = a3;
}

- (NSString)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_currentValue, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentSetupField writeTo:]", "NPKProtoStandalonePaymentSetupField.m", 102, "nil != self->_identifier");
}

@end