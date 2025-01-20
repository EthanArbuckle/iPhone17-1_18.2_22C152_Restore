@interface POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported
- (BOOL)hasGeoAppResolutionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)geoAppResolutionType;
- (unint64_t)hash;
- (void)deleteGeoAppResolutionType;
- (void)setGeoAppResolutionType:(int)a3;
- (void)setHasGeoAppResolutionType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)geoAppResolutionType
{
  return self->_geoAppResolutionType;
}

- (POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported;
  v5 = [(POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"geoAppResolutionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported setGeoAppResolutionType:](v5, "setGeoAppResolutionType:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *)self dictionaryRepresentation];
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
    unsigned int v4 = [(POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *)self geoAppResolutionType]
       - 1;
    if (v4 > 2) {
      v5 = @"POMMESPEGASUSREQUESTGEOAPPRESOLUTIONTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EBE0C8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"geoAppResolutionType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_geoAppResolutionType;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int geoAppResolutionType = self->_geoAppResolutionType,
            geoAppResolutionType == [v4 geoAppResolutionType]))
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
  return POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteGeoAppResolutionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasGeoAppResolutionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGeoAppResolutionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setGeoAppResolutionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int geoAppResolutionType = a3;
}

@end