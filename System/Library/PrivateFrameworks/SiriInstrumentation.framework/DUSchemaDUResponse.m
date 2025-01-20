@interface DUSchemaDUResponse
- (BOOL)hasAssetIdentifier;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DUSchemaDUResponse)initWithDictionary:(id)a3;
- (DUSchemaDUResponse)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)assetIdentifier;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)status;
- (unint64_t)hash;
- (void)deleteAssetIdentifier;
- (void)deleteStatus;
- (void)setAssetIdentifier:(id)a3;
- (void)setHasAssetIdentifier:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DUSchemaDUResponse

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DUSchemaDUResponse;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DUSchemaDUResponse *)self assetIdentifier];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(DUSchemaDUResponse *)self deleteAssetIdentifier];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasAssetIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (SISchemaUUID)assetIdentifier
{
  return self->_assetIdentifier;
}

- (int)status
{
  return self->_status;
}

- (DUSchemaDUResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DUSchemaDUResponse;
  v5 = [(DUSchemaDUResponse *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DUSchemaDUResponse setStatus:](v5, "setStatus:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"assetIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[SISchemaUUID alloc] initWithDictionary:v7];
      [(DUSchemaDUResponse *)v5 setAssetIdentifier:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (DUSchemaDUResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DUSchemaDUResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DUSchemaDUResponse *)self dictionaryRepresentation];
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
  if (self->_assetIdentifier)
  {
    id v4 = [(DUSchemaDUResponse *)self assetIdentifier];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"assetIdentifier"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"assetIdentifier"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ([(DUSchemaDUResponse *)self status] == 1) {
      uint64_t v7 = @"FAILED";
    }
    else {
      uint64_t v7 = @"SUCCESS";
    }
    [v3 setObject:v7 forKeyedSubscript:@"status"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_status;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(SISchemaUUID *)self->_assetIdentifier hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int status = self->_status, status == [v4 status]))
      {
        v6 = [(DUSchemaDUResponse *)self assetIdentifier];
        uint64_t v7 = [v4 assetIdentifier];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(DUSchemaDUResponse *)self assetIdentifier];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(DUSchemaDUResponse *)self assetIdentifier];
          v12 = [v4 assetIdentifier];
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
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(DUSchemaDUResponse *)self assetIdentifier];

  v5 = v7;
  if (v4)
  {
    v6 = [(DUSchemaDUResponse *)self assetIdentifier];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return DUSchemaDUResponseReadFrom(self, (uint64_t)a3);
}

- (void)deleteAssetIdentifier
{
}

- (BOOL)hasAssetIdentifier
{
  return self->_assetIdentifier != 0;
}

- (void)deleteStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int status = a3;
}

@end