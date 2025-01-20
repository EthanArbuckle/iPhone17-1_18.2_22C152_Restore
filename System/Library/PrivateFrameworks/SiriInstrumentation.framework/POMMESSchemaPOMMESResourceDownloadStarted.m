@interface POMMESSchemaPOMMESResourceDownloadStarted
- (BOOL)hasResourceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESResourceDownloadStarted)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESResourceDownloadStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)resourceType;
- (unint64_t)hash;
- (void)deleteResourceType;
- (void)setHasResourceType:(BOOL)a3;
- (void)setResourceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESResourceDownloadStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)resourceType
{
  return self->_resourceType;
}

- (POMMESSchemaPOMMESResourceDownloadStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESResourceDownloadStarted;
  v5 = [(POMMESSchemaPOMMESResourceDownloadStarted *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"resourceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESResourceDownloadStarted setResourceType:](v5, "setResourceType:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESResourceDownloadStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESResourceDownloadStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESResourceDownloadStarted *)self dictionaryRepresentation];
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
    if ([(POMMESSchemaPOMMESResourceDownloadStarted *)self resourceType] == 1) {
      id v4 = @"POMMESRESOURCEDOWNLOADTYPE_KG_HERO_IMAGE";
    }
    else {
      id v4 = @"POMMESRESOURCEDOWNLOADTYPE_UNKNOWN";
    }
    [v3 setObject:v4 forKeyedSubscript:@"resourceType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_resourceType;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int resourceType = self->_resourceType, resourceType == [v4 resourceType]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESResourceDownloadStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteResourceType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResourceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResourceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResourceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int resourceType = a3;
}

@end