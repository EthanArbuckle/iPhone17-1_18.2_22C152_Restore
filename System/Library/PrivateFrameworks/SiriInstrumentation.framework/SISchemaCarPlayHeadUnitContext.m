@interface SISchemaCarPlayHeadUnitContext
- (BOOL)hasVehicleManufacturer;
- (BOOL)hasVehicleModel;
- (BOOL)hasVehicleName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)vehicleManufacturer;
- (NSString)vehicleModel;
- (NSString)vehicleName;
- (SISchemaCarPlayHeadUnitContext)initWithDictionary:(id)a3;
- (SISchemaCarPlayHeadUnitContext)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteVehicleManufacturer;
- (void)deleteVehicleModel;
- (void)deleteVehicleName;
- (void)setHasVehicleManufacturer:(BOOL)a3;
- (void)setHasVehicleModel:(BOOL)a3;
- (void)setHasVehicleName:(BOOL)a3;
- (void)setVehicleManufacturer:(id)a3;
- (void)setVehicleModel:(id)a3;
- (void)setVehicleName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaCarPlayHeadUnitContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleManufacturer, 0);
  objc_storeStrong((id *)&self->_vehicleModel, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
}

- (void)setHasVehicleManufacturer:(BOOL)a3
{
  self->_hasVehicleManufacturer = a3;
}

- (void)setHasVehicleModel:(BOOL)a3
{
  self->_hasVehicleModel = a3;
}

- (void)setHasVehicleName:(BOOL)a3
{
  self->_hasVehicleName = a3;
}

- (void)setVehicleManufacturer:(id)a3
{
}

- (NSString)vehicleManufacturer
{
  return self->_vehicleManufacturer;
}

- (void)setVehicleModel:(id)a3
{
}

- (NSString)vehicleModel
{
  return self->_vehicleModel;
}

- (void)setVehicleName:(id)a3
{
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (SISchemaCarPlayHeadUnitContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaCarPlayHeadUnitContext;
  v5 = [(SISchemaCarPlayHeadUnitContext *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"vehicleName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaCarPlayHeadUnitContext *)v5 setVehicleName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"vehicleModel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaCarPlayHeadUnitContext *)v5 setVehicleModel:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"vehicleManufacturer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(SISchemaCarPlayHeadUnitContext *)v5 setVehicleManufacturer:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (SISchemaCarPlayHeadUnitContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaCarPlayHeadUnitContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaCarPlayHeadUnitContext *)self dictionaryRepresentation];
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
  if (self->_vehicleManufacturer)
  {
    id v4 = [(SISchemaCarPlayHeadUnitContext *)self vehicleManufacturer];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"vehicleManufacturer"];
  }
  if (self->_vehicleModel)
  {
    v6 = [(SISchemaCarPlayHeadUnitContext *)self vehicleModel];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"vehicleModel"];
  }
  if (self->_vehicleName)
  {
    v8 = [(SISchemaCarPlayHeadUnitContext *)self vehicleName];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"vehicleName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_vehicleName hash];
  NSUInteger v4 = [(NSString *)self->_vehicleModel hash] ^ v3;
  return v4 ^ [(NSString *)self->_vehicleManufacturer hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(SISchemaCarPlayHeadUnitContext *)self vehicleName];
  v6 = [v4 vehicleName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(SISchemaCarPlayHeadUnitContext *)self vehicleName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SISchemaCarPlayHeadUnitContext *)self vehicleName];
    v10 = [v4 vehicleName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(SISchemaCarPlayHeadUnitContext *)self vehicleModel];
  v6 = [v4 vehicleModel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(SISchemaCarPlayHeadUnitContext *)self vehicleModel];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(SISchemaCarPlayHeadUnitContext *)self vehicleModel];
    v15 = [v4 vehicleModel];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(SISchemaCarPlayHeadUnitContext *)self vehicleManufacturer];
  v6 = [v4 vehicleManufacturer];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(SISchemaCarPlayHeadUnitContext *)self vehicleManufacturer];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(SISchemaCarPlayHeadUnitContext *)self vehicleManufacturer];
    v20 = [v4 vehicleManufacturer];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(SISchemaCarPlayHeadUnitContext *)self vehicleName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(SISchemaCarPlayHeadUnitContext *)self vehicleModel];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(SISchemaCarPlayHeadUnitContext *)self vehicleManufacturer];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCarPlayHeadUnitContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteVehicleManufacturer
{
}

- (BOOL)hasVehicleManufacturer
{
  return self->_vehicleManufacturer != 0;
}

- (void)deleteVehicleModel
{
}

- (BOOL)hasVehicleModel
{
  return self->_vehicleModel != 0;
}

- (void)deleteVehicleName
{
}

- (BOOL)hasVehicleName
{
  return self->_vehicleName != 0;
}

@end