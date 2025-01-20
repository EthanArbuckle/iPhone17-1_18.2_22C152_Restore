@interface NLXSchemaMILAssetAcquisitionFailed
- (BOOL)hasAcquisitionType;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaMILAssetAcquisitionFailed)initWithDictionary:(id)a3;
- (NLXSchemaMILAssetAcquisitionFailed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)errorMessage;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)acquisitionType;
- (int)errorCode;
- (unint64_t)hash;
- (void)deleteAcquisitionType;
- (void)deleteErrorCode;
- (void)deleteErrorMessage;
- (void)setAcquisitionType:(int)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorMessage:(id)a3;
- (void)setHasAcquisitionType:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorMessage:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaMILAssetAcquisitionFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasErrorMessage:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)acquisitionType
{
  return self->_acquisitionType;
}

- (NLXSchemaMILAssetAcquisitionFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaMILAssetAcquisitionFailed;
  v5 = [(NLXSchemaMILAssetAcquisitionFailed *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"acquisitionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaMILAssetAcquisitionFailed setAcquisitionType:](v5, "setAcquisitionType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaMILAssetAcquisitionFailed setErrorCode:](v5, "setErrorCode:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"errorMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(NLXSchemaMILAssetAcquisitionFailed *)v5 setErrorMessage:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (NLXSchemaMILAssetAcquisitionFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaMILAssetAcquisitionFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaMILAssetAcquisitionFailed *)self dictionaryRepresentation];
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
    int v5 = [(NLXSchemaMILAssetAcquisitionFailed *)self acquisitionType];
    v6 = @"MILASSETACQUISITIONTYPE_UNKNOWN";
    if (v5 == 1) {
      v6 = @"MILASSETACQUISITIONTYPE_CACHE";
    }
    if (v5 == 2) {
      uint64_t v7 = @"MILASSETACQUISITIONTYPE_RECOMPILE";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"acquisitionType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v8 = [(NLXSchemaMILAssetAcquisitionFailed *)self errorCode] - 1;
    if (v8 > 6) {
      v9 = @"MILASSETACQUISITIONERRORCODE_UNKNOWN";
    }
    else {
      v9 = off_1E5EBC628[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorMessage)
  {
    v10 = [(NLXSchemaMILAssetAcquisitionFailed *)self errorMessage];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"errorMessage"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_acquisitionType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_errorMessage hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_errorCode;
  return v3 ^ v2 ^ [(NSString *)self->_errorMessage hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $E47D04E33ECD8651FFE07BDED7CBF157 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int acquisitionType = self->_acquisitionType;
    if (acquisitionType != [v4 acquisitionType]) {
      goto LABEL_14;
    }
    $E47D04E33ECD8651FFE07BDED7CBF157 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (int errorCode = self->_errorCode, errorCode == [v4 errorCode]))
    {
      v10 = [(NLXSchemaMILAssetAcquisitionFailed *)self errorMessage];
      v11 = [v4 errorMessage];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(NLXSchemaMILAssetAcquisitionFailed *)self errorMessage];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(NLXSchemaMILAssetAcquisitionFailed *)self errorMessage];
        v16 = [v4 errorMessage];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(NLXSchemaMILAssetAcquisitionFailed *)self errorMessage];

  unsigned int v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    unsigned int v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMILAssetAcquisitionFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteErrorMessage
{
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int errorCode = a3;
}

- (void)deleteAcquisitionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAcquisitionType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAcquisitionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAcquisitionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int acquisitionType = a3;
}

@end