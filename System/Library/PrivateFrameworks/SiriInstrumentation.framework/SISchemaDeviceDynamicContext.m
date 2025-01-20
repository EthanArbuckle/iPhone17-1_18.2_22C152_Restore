@interface SISchemaDeviceDynamicContext
- (BOOL)hasCountryCode;
- (BOOL)hasLocation;
- (BOOL)hasTimeIntervalSince1970;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)countryCode;
- (SISchemaDeviceDynamicContext)initWithDictionary:(id)a3;
- (SISchemaDeviceDynamicContext)initWithJSON:(id)a3;
- (SISchemaLocation)location;
- (double)timeIntervalSince1970;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCountryCode;
- (void)deleteLocation;
- (void)deleteTimeIntervalSince1970;
- (void)setCountryCode:(id)a3;
- (void)setHasCountryCode:(BOOL)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setHasTimeIntervalSince1970:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setTimeIntervalSince1970:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaDeviceDynamicContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaDeviceDynamicContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaDeviceDynamicContext *)self location];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaDeviceDynamicContext *)self deleteLocation];
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
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (void)setHasCountryCode:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLocation:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setLocation:(id)a3
{
}

- (SISchemaLocation)location
{
  return self->_location;
}

- (SISchemaDeviceDynamicContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaDeviceDynamicContext;
  v5 = [(SISchemaDeviceDynamicContext *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaLocation alloc] initWithDictionary:v6];
      [(SISchemaDeviceDynamicContext *)v5 setLocation:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"countryCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(SISchemaDeviceDynamicContext *)v5 setCountryCode:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"timeIntervalSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[SISchemaDeviceDynamicContext setTimeIntervalSince1970:](v5, "setTimeIntervalSince1970:");
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaDeviceDynamicContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaDeviceDynamicContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaDeviceDynamicContext *)self dictionaryRepresentation];
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
  if (self->_countryCode)
  {
    id v4 = [(SISchemaDeviceDynamicContext *)self countryCode];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"countryCode"];
  }
  if (self->_location)
  {
    v6 = [(SISchemaDeviceDynamicContext *)self location];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"location"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"location"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v9 = NSNumber;
    [(SISchemaDeviceDynamicContext *)self timeIntervalSince1970];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    [v3 setObject:v10 forKeyedSubscript:@"timeIntervalSince1970"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaLocation *)self->_location hash];
  NSUInteger v4 = [(NSString *)self->_countryCode hash];
  if (*(unsigned char *)&self->_has)
  {
    double timeIntervalSince1970 = self->_timeIntervalSince1970;
    double v7 = -timeIntervalSince1970;
    if (timeIntervalSince1970 >= 0.0) {
      double v7 = self->_timeIntervalSince1970;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  unint64_t v5 = [(SISchemaDeviceDynamicContext *)self location];
  v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaDeviceDynamicContext *)self location];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(SISchemaDeviceDynamicContext *)self location];
    v10 = [v4 location];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDeviceDynamicContext *)self countryCode];
  v6 = [v4 countryCode];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SISchemaDeviceDynamicContext *)self countryCode];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaDeviceDynamicContext *)self countryCode];
    v15 = [v4 countryCode];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (double timeIntervalSince1970 = self->_timeIntervalSince1970,
          [v4 timeIntervalSince1970],
          timeIntervalSince1970 == v20))
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
  NSUInteger v4 = [(SISchemaDeviceDynamicContext *)self location];

  if (v4)
  {
    unint64_t v5 = [(SISchemaDeviceDynamicContext *)self location];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaDeviceDynamicContext *)self countryCode];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = v8;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDeviceDynamicContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteTimeIntervalSince1970
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTimeIntervalSince1970:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeIntervalSince1970
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double timeIntervalSince1970 = a3;
}

- (void)deleteCountryCode
{
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)deleteLocation
{
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

@end