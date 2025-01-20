@interface SISchemaCarBluetoothHeadUnit
- (BOOL)hasCarMake;
- (BOOL)hasCarModel;
- (BOOL)hasCarYear;
- (BOOL)hasHeadUnitProductId;
- (BOOL)hasHeadUnitVendorId;
- (BOOL)hasOrganizationallyUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)carMake;
- (NSString)carModel;
- (NSString)headUnitProductId;
- (NSString)headUnitVendorId;
- (NSString)organizationallyUniqueId;
- (SISchemaCarBluetoothHeadUnit)initWithDictionary:(id)a3;
- (SISchemaCarBluetoothHeadUnit)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)carYear;
- (void)deleteCarMake;
- (void)deleteCarModel;
- (void)deleteCarYear;
- (void)deleteHeadUnitProductId;
- (void)deleteHeadUnitVendorId;
- (void)deleteOrganizationallyUniqueId;
- (void)setCarMake:(id)a3;
- (void)setCarModel:(id)a3;
- (void)setCarYear:(unsigned int)a3;
- (void)setHasCarMake:(BOOL)a3;
- (void)setHasCarModel:(BOOL)a3;
- (void)setHasCarYear:(BOOL)a3;
- (void)setHasHeadUnitProductId:(BOOL)a3;
- (void)setHasHeadUnitVendorId:(BOOL)a3;
- (void)setHasOrganizationallyUniqueId:(BOOL)a3;
- (void)setHeadUnitProductId:(id)a3;
- (void)setHeadUnitVendorId:(id)a3;
- (void)setOrganizationallyUniqueId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaCarBluetoothHeadUnit

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationallyUniqueId, 0);
  objc_storeStrong((id *)&self->_carModel, 0);
  objc_storeStrong((id *)&self->_carMake, 0);
  objc_storeStrong((id *)&self->_headUnitProductId, 0);
  objc_storeStrong((id *)&self->_headUnitVendorId, 0);
}

- (void)setHasOrganizationallyUniqueId:(BOOL)a3
{
  self->_hasHeadUnitProductId = a3;
}

- (void)setHasCarModel:(BOOL)a3
{
  self->_hasHeadUnitVendorId = a3;
}

- (void)setHasCarMake:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasHeadUnitProductId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasHeadUnitVendorId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setOrganizationallyUniqueId:(id)a3
{
}

- (NSString)organizationallyUniqueId
{
  return self->_organizationallyUniqueId;
}

- (unsigned)carYear
{
  return self->_carYear;
}

- (void)setCarModel:(id)a3
{
}

- (NSString)carModel
{
  return self->_carModel;
}

- (void)setCarMake:(id)a3
{
}

- (NSString)carMake
{
  return self->_carMake;
}

- (void)setHeadUnitProductId:(id)a3
{
}

- (NSString)headUnitProductId
{
  return self->_headUnitProductId;
}

- (void)setHeadUnitVendorId:(id)a3
{
}

- (NSString)headUnitVendorId
{
  return self->_headUnitVendorId;
}

- (SISchemaCarBluetoothHeadUnit)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SISchemaCarBluetoothHeadUnit;
  v5 = [(SISchemaCarBluetoothHeadUnit *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"headUnitVendorId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaCarBluetoothHeadUnit *)v5 setHeadUnitVendorId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"headUnitProductId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaCarBluetoothHeadUnit *)v5 setHeadUnitProductId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"carMake"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(SISchemaCarBluetoothHeadUnit *)v5 setCarMake:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"carModel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(SISchemaCarBluetoothHeadUnit *)v5 setCarModel:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"carYear"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaCarBluetoothHeadUnit setCarYear:](v5, "setCarYear:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"organizationallyUniqueId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(SISchemaCarBluetoothHeadUnit *)v5 setOrganizationallyUniqueId:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (SISchemaCarBluetoothHeadUnit)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaCarBluetoothHeadUnit *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaCarBluetoothHeadUnit *)self dictionaryRepresentation];
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
  if (self->_carMake)
  {
    id v4 = [(SISchemaCarBluetoothHeadUnit *)self carMake];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"carMake"];
  }
  if (self->_carModel)
  {
    v6 = [(SISchemaCarBluetoothHeadUnit *)self carModel];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"carModel"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaCarBluetoothHeadUnit carYear](self, "carYear"));
    [v3 setObject:v8 forKeyedSubscript:@"carYear"];
  }
  if (self->_headUnitProductId)
  {
    v9 = [(SISchemaCarBluetoothHeadUnit *)self headUnitProductId];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"headUnitProductId"];
  }
  if (self->_headUnitVendorId)
  {
    v11 = [(SISchemaCarBluetoothHeadUnit *)self headUnitVendorId];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"headUnitVendorId"];
  }
  if (self->_organizationallyUniqueId)
  {
    v13 = [(SISchemaCarBluetoothHeadUnit *)self organizationallyUniqueId];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"organizationallyUniqueId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_headUnitVendorId hash];
  NSUInteger v4 = [(NSString *)self->_headUnitProductId hash];
  NSUInteger v5 = [(NSString *)self->_carMake hash];
  NSUInteger v6 = [(NSString *)self->_carModel hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_carYear;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_organizationallyUniqueId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  NSUInteger v5 = [(SISchemaCarBluetoothHeadUnit *)self headUnitVendorId];
  NSUInteger v6 = [v4 headUnitVendorId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(SISchemaCarBluetoothHeadUnit *)self headUnitVendorId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SISchemaCarBluetoothHeadUnit *)self headUnitVendorId];
    v10 = [v4 headUnitVendorId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaCarBluetoothHeadUnit *)self headUnitProductId];
  NSUInteger v6 = [v4 headUnitProductId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v12 = [(SISchemaCarBluetoothHeadUnit *)self headUnitProductId];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(SISchemaCarBluetoothHeadUnit *)self headUnitProductId];
    v15 = [v4 headUnitProductId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaCarBluetoothHeadUnit *)self carMake];
  NSUInteger v6 = [v4 carMake];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v17 = [(SISchemaCarBluetoothHeadUnit *)self carMake];
  if (v17)
  {
    v18 = (void *)v17;
    objc_super v19 = [(SISchemaCarBluetoothHeadUnit *)self carMake];
    v20 = [v4 carMake];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaCarBluetoothHeadUnit *)self carModel];
  NSUInteger v6 = [v4 carModel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v22 = [(SISchemaCarBluetoothHeadUnit *)self carModel];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(SISchemaCarBluetoothHeadUnit *)self carModel];
    v25 = [v4 carModel];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int carYear = self->_carYear;
    if (carYear != [v4 carYear]) {
      goto LABEL_30;
    }
  }
  NSUInteger v5 = [(SISchemaCarBluetoothHeadUnit *)self organizationallyUniqueId];
  NSUInteger v6 = [v4 organizationallyUniqueId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v28 = [(SISchemaCarBluetoothHeadUnit *)self organizationallyUniqueId];
    if (!v28)
    {

LABEL_33:
      BOOL v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    v30 = [(SISchemaCarBluetoothHeadUnit *)self organizationallyUniqueId];
    v31 = [v4 organizationallyUniqueId];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_33;
    }
  }
  else
  {
LABEL_29:
  }
LABEL_30:
  BOOL v33 = 0;
LABEL_31:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  NSUInteger v4 = [(SISchemaCarBluetoothHeadUnit *)self headUnitVendorId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(SISchemaCarBluetoothHeadUnit *)self headUnitProductId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(SISchemaCarBluetoothHeadUnit *)self carMake];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(SISchemaCarBluetoothHeadUnit *)self carModel];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  v8 = [(SISchemaCarBluetoothHeadUnit *)self organizationallyUniqueId];

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCarBluetoothHeadUnitReadFrom(self, (uint64_t)a3);
}

- (void)deleteOrganizationallyUniqueId
{
}

- (BOOL)hasOrganizationallyUniqueId
{
  return self->_organizationallyUniqueId != 0;
}

- (void)deleteCarYear
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCarYear:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCarYear
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCarYear:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int carYear = a3;
}

- (void)deleteCarModel
{
}

- (BOOL)hasCarModel
{
  return self->_carModel != 0;
}

- (void)deleteCarMake
{
}

- (BOOL)hasCarMake
{
  return self->_carMake != 0;
}

- (void)deleteHeadUnitProductId
{
}

- (BOOL)hasHeadUnitProductId
{
  return self->_headUnitProductId != 0;
}

- (void)deleteHeadUnitVendorId
{
}

- (BOOL)hasHeadUnitVendorId
{
  return self->_headUnitVendorId != 0;
}

@end