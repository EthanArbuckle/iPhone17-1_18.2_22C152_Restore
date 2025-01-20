@interface PAPBOutOfProcessPickerAccess
- (BOOL)hasAccess;
- (BOOL)hasPickerType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PAPBAccess)access;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)pickerType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAccess:(id)a3;
- (void)setHasPickerType:(BOOL)a3;
- (void)setPickerType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PAPBOutOfProcessPickerAccess

- (BOOL)hasAccess
{
  return self->_access != 0;
}

- (int)pickerType
{
  if (*(unsigned char *)&self->_has) {
    return self->_pickerType;
  }
  else {
    return 0;
  }
}

- (void)setPickerType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pickerType = a3;
}

- (void)setHasPickerType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPickerType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PAPBOutOfProcessPickerAccess;
  v4 = [(PAPBOutOfProcessPickerAccess *)&v8 description];
  v5 = [(PAPBOutOfProcessPickerAccess *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  access = self->_access;
  if (access)
  {
    v5 = [(PAPBAccess *)access dictionaryRepresentation];
    [v3 setObject:v5 forKeyedSubscript:@"access"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_pickerType];
    [v3 setObject:v6 forKeyedSubscript:@"pickerType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PAPBOutOfProcessPickerAccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_access)
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PAPBAccess *)self->_access copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_pickerType;
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
  access = self->_access;
  if ((unint64_t)access | *((void *)v4 + 1))
  {
    if (!-[PAPBAccess isEqual:](access, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_pickerType == *((_DWORD *)v4 + 4))
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
  unint64_t v3 = [(PAPBAccess *)self->_access hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_pickerType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  access = self->_access;
  uint64_t v6 = *((void *)v4 + 1);
  if (access)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[PAPBAccess mergeFrom:](access, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[PAPBOutOfProcessPickerAccess setAccess:](self, "setAccess:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 20))
  {
    self->_pickerType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8]();
}

- (PAPBAccess)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
}

- (void).cxx_destruct
{
}

@end