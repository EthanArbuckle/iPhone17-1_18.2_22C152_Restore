@interface NLRouterSchemaNLRouterSubComponentSetupStarted
- (BOOL)hasAssetVersion;
- (BOOL)hasNlRouterSubComponent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLRouterSchemaNLRouterSubComponentSetupStarted)initWithDictionary:(id)a3;
- (NLRouterSchemaNLRouterSubComponentSetupStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaVersion)assetVersion;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)nlRouterSubComponent;
- (unint64_t)hash;
- (void)deleteAssetVersion;
- (void)deleteNlRouterSubComponent;
- (void)setAssetVersion:(id)a3;
- (void)setHasAssetVersion:(BOOL)a3;
- (void)setHasNlRouterSubComponent:(BOOL)a3;
- (void)setNlRouterSubComponent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLRouterSchemaNLRouterSubComponentSetupStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLRouterSchemaNLRouterSubComponentSetupStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self assetVersion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self deleteAssetVersion];
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

- (void)setHasAssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAssetVersion:(id)a3
{
}

- (SISchemaVersion)assetVersion
{
  return self->_assetVersion;
}

- (int)nlRouterSubComponent
{
  return self->_nlRouterSubComponent;
}

- (NLRouterSchemaNLRouterSubComponentSetupStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLRouterSchemaNLRouterSubComponentSetupStarted;
  v5 = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"nlRouterSubComponent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterSubComponentSetupStarted setNlRouterSubComponent:](v5, "setNlRouterSubComponent:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"assetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[SISchemaVersion alloc] initWithDictionary:v7];
      [(NLRouterSchemaNLRouterSubComponentSetupStarted *)v5 setAssetVersion:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (NLRouterSchemaNLRouterSubComponentSetupStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self dictionaryRepresentation];
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
  if (self->_assetVersion)
  {
    id v4 = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self assetVersion];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"assetVersion"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"assetVersion"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self nlRouterSubComponent] - 1;
    if (v7 > 5) {
      v8 = @"NLROUTERSUBCOMPONENT_UNKNOWN";
    }
    else {
      v8 = off_1E5EBE168[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"nlRouterSubComponent"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_nlRouterSubComponent;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(SISchemaVersion *)self->_assetVersion hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int nlRouterSubComponent = self->_nlRouterSubComponent,
            nlRouterSubComponent == [v4 nlRouterSubComponent]))
      {
        v6 = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self assetVersion];
        unsigned int v7 = [v4 assetVersion];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self assetVersion];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self assetVersion];
          v12 = [v4 assetVersion];
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
  id v4 = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self assetVersion];

  v5 = v7;
  if (v4)
  {
    v6 = [(NLRouterSchemaNLRouterSubComponentSetupStarted *)self assetVersion];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterSubComponentSetupStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAssetVersion
{
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)deleteNlRouterSubComponent
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNlRouterSubComponent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNlRouterSubComponent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNlRouterSubComponent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int nlRouterSubComponent = a3;
}

@end