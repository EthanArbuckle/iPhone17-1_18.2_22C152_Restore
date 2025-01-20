@interface NETSchemaNETClientEventMetadata
- (BOOL)hasNetId;
- (BOOL)hasNetworkConnectionId;
- (BOOL)hasProvider;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETClientEventMetadata)initWithDictionary:(id)a3;
- (NETSchemaNETClientEventMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)netId;
- (SISchemaUUID)networkConnectionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)provider;
- (unint64_t)hash;
- (void)deleteNetId;
- (void)deleteNetworkConnectionId;
- (void)deleteProvider;
- (void)setHasNetId:(BOOL)a3;
- (void)setHasNetworkConnectionId:(BOOL)a3;
- (void)setHasProvider:(BOOL)a3;
- (void)setNetId:(id)a3;
- (void)setNetworkConnectionId:(id)a3;
- (void)setProvider:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NETSchemaNETClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(NETSchemaNETClientEventMetadata *)self netId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NETSchemaNETClientEventMetadata *)self deleteNetId];
  }
  v9 = [(NETSchemaNETClientEventMetadata *)self networkConnectionId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NETSchemaNETClientEventMetadata *)self deleteNetworkConnectionId];
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
  objc_storeStrong((id *)&self->_networkConnectionId, 0);
  objc_storeStrong((id *)&self->_netId, 0);
}

- (void)setHasNetworkConnectionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasNetId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)provider
{
  return self->_provider;
}

- (void)setNetworkConnectionId:(id)a3
{
}

- (SISchemaUUID)networkConnectionId
{
  return self->_networkConnectionId;
}

- (void)setNetId:(id)a3
{
}

- (SISchemaUUID)netId
{
  return self->_netId;
}

- (NETSchemaNETClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NETSchemaNETClientEventMetadata;
  v5 = [(NETSchemaNETClientEventMetadata *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"netId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NETSchemaNETClientEventMetadata *)v5 setNetId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"networkConnectionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(NETSchemaNETClientEventMetadata *)v5 setNetworkConnectionId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"provider"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETClientEventMetadata setProvider:](v5, "setProvider:", [v10 intValue]);
    }
    int v11 = v5;
  }
  return v5;
}

- (NETSchemaNETClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_netId)
  {
    id v4 = [(NETSchemaNETClientEventMetadata *)self netId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"netId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"netId"];
    }
  }
  if (self->_networkConnectionId)
  {
    uint64_t v7 = [(NETSchemaNETClientEventMetadata *)self networkConnectionId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"networkConnectionId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"networkConnectionId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v10 = [(NETSchemaNETClientEventMetadata *)self provider] - 1;
    if (v10 > 4) {
      int v11 = @"NETPROVIDER_UNKNOWN";
    }
    else {
      int v11 = off_1E5EB2890[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"provider"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_netId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_networkConnectionId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_provider;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(NETSchemaNETClientEventMetadata *)self netId];
  v6 = [v4 netId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NETSchemaNETClientEventMetadata *)self netId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(NETSchemaNETClientEventMetadata *)self netId];
    unsigned int v10 = [v4 netId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NETSchemaNETClientEventMetadata *)self networkConnectionId];
  v6 = [v4 networkConnectionId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(NETSchemaNETClientEventMetadata *)self networkConnectionId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(NETSchemaNETClientEventMetadata *)self networkConnectionId];
    v15 = [v4 networkConnectionId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int provider = self->_provider, provider == [v4 provider]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(NETSchemaNETClientEventMetadata *)self netId];

  if (v4)
  {
    uint64_t v5 = [(NETSchemaNETClientEventMetadata *)self netId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(NETSchemaNETClientEventMetadata *)self networkConnectionId];

  if (v6)
  {
    uint64_t v7 = [(NETSchemaNETClientEventMetadata *)self networkConnectionId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteProvider
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProvider:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProvider
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProvider:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int provider = a3;
}

- (void)deleteNetworkConnectionId
{
}

- (BOOL)hasNetworkConnectionId
{
  return self->_networkConnectionId != 0;
}

- (void)deleteNetId
{
}

- (BOOL)hasNetId
{
  return self->_netId != 0;
}

@end