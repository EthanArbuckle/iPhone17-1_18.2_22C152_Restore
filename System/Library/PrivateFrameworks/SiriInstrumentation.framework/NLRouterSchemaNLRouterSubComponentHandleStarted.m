@interface NLRouterSchemaNLRouterSubComponentHandleStarted
- (BOOL)hasAssetVersion;
- (BOOL)hasNlRouterSubComponent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLRouterSchemaNLRouterSubComponentHandleStarted)initWithDictionary:(id)a3;
- (NLRouterSchemaNLRouterSubComponentHandleStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)assetVersion;
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

@implementation NLRouterSchemaNLRouterSubComponentHandleStarted

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

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (int)nlRouterSubComponent
{
  return self->_nlRouterSubComponent;
}

- (NLRouterSchemaNLRouterSubComponentHandleStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLRouterSchemaNLRouterSubComponentHandleStarted;
  v5 = [(NLRouterSchemaNLRouterSubComponentHandleStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"nlRouterSubComponent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterSubComponentHandleStarted setNlRouterSubComponent:](v5, "setNlRouterSubComponent:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"assetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(NLRouterSchemaNLRouterSubComponentHandleStarted *)v5 setAssetVersion:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (NLRouterSchemaNLRouterSubComponentHandleStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLRouterSchemaNLRouterSubComponentHandleStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLRouterSchemaNLRouterSubComponentHandleStarted *)self dictionaryRepresentation];
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
    id v4 = [(NLRouterSchemaNLRouterSubComponentHandleStarted *)self assetVersion];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assetVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = [(NLRouterSchemaNLRouterSubComponentHandleStarted *)self nlRouterSubComponent] - 1;
    if (v6 > 5) {
      uint64_t v7 = @"NLROUTERSUBCOMPONENT_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBE138[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"nlRouterSubComponent"];
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
  return [(NSString *)self->_assetVersion hash] ^ v2;
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
        unsigned int v6 = [(NLRouterSchemaNLRouterSubComponentHandleStarted *)self assetVersion];
        uint64_t v7 = [v4 assetVersion];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(NLRouterSchemaNLRouterSubComponentHandleStarted *)self assetVersion];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(NLRouterSchemaNLRouterSubComponentHandleStarted *)self assetVersion];
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
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(NLRouterSchemaNLRouterSubComponentHandleStarted *)self assetVersion];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterSubComponentHandleStartedReadFrom(self, (uint64_t)a3);
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