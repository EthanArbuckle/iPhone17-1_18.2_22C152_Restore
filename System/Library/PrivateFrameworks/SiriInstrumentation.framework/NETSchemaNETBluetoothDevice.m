@interface NETSchemaNETBluetoothDevice
- (BOOL)hasIndex;
- (BOOL)hasRssi;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETBluetoothDevice)initWithDictionary:(id)a3;
- (NETSchemaNETBluetoothDevice)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)rssi;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)index;
- (void)deleteIndex;
- (void)deleteRssi;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setRssi:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETBluetoothDevice

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)rssi
{
  return self->_rssi;
}

- (unsigned)index
{
  return self->_index;
}

- (NETSchemaNETBluetoothDevice)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NETSchemaNETBluetoothDevice;
  v5 = [(NETSchemaNETBluetoothDevice *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"index"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETBluetoothDevice setIndex:](v5, "setIndex:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"rssi"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[NETSchemaNETBluetoothDevice setRssi:](v5, "setRssi:");
    }
    v8 = v5;
  }
  return v5;
}

- (NETSchemaNETBluetoothDevice)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETBluetoothDevice *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETBluetoothDevice *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETBluetoothDevice index](self, "index"));
    [v3 setObject:v5 forKeyedSubscript:@"index"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = NSNumber;
    [(NETSchemaNETBluetoothDevice *)self rssi];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"rssi"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_index;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double rssi = self->_rssi;
  double v4 = -rssi;
  if (rssi >= 0.0) {
    double v4 = self->_rssi;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  $E3EC128958873056EC2E20073FD30A70 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int index = self->_index;
    if (index != [v4 index]) {
      goto LABEL_9;
    }
    $E3EC128958873056EC2E20073FD30A70 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (double rssi = self->_rssi, [v4 rssi], rssi == v10))
    {
      BOOL v11 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETBluetoothDeviceReadFrom(self, (uint64_t)a3);
}

- (void)deleteRssi
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRssi
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRssi:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double rssi = a3;
}

- (void)deleteIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int index = a3;
}

@end