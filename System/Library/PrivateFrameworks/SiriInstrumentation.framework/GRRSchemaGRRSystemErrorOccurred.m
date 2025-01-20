@interface GRRSchemaGRRSystemErrorOccurred
- (BOOL)hasErrorCode;
- (BOOL)hasErrorMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GRRSchemaGRRSystemErrorOccurred)initWithDictionary:(id)a3;
- (GRRSchemaGRRSystemErrorOccurred)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)errorMessage;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorMessage;
- (void)setErrorCode:(int)a3;
- (void)setErrorMessage:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorMessage:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GRRSchemaGRRSystemErrorOccurred

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

- (GRRSchemaGRRSystemErrorOccurred)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GRRSchemaGRRSystemErrorOccurred;
  v5 = [(GRRSchemaGRRSystemErrorOccurred *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRSystemErrorOccurred setErrorCode:](v5, "setErrorCode:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"errorMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(GRRSchemaGRRSystemErrorOccurred *)v5 setErrorMessage:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (GRRSchemaGRRSystemErrorOccurred)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRRSchemaGRRSystemErrorOccurred *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRRSchemaGRRSystemErrorOccurred *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [(GRRSchemaGRRSystemErrorOccurred *)self errorCode];
    v5 = @"GRRERRORCODE_UNKNOWN";
    if (v4 == 1) {
      v5 = @"GRRERRORCODE_FEATURE_EXTRACTION_ERROR";
    }
    if (v4 == 2) {
      v6 = @"GRRERRORCODE_RANKING_ERROR";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorMessage)
  {
    uint64_t v7 = [(GRRSchemaGRRSystemErrorOccurred *)self errorMessage];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"errorMessage"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_errorMessage hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int errorCode = self->_errorCode, errorCode == [v4 errorCode]))
      {
        v6 = [(GRRSchemaGRRSystemErrorOccurred *)self errorMessage];
        uint64_t v7 = [v4 errorMessage];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(GRRSchemaGRRSystemErrorOccurred *)self errorMessage];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(GRRSchemaGRRSystemErrorOccurred *)self errorMessage];
          v12 = [v4 errorMessage];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  int v4 = [(GRRSchemaGRRSystemErrorOccurred *)self errorMessage];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRSystemErrorOccurredReadFrom(self, (uint64_t)a3);
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
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int errorCode = a3;
}

@end