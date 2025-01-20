@interface PFAPFAEventMetadata
- (BOOL)hasDeviceDimensions;
- (BOOL)hasEventTimestampInMsSince1970;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PFAPFADeviceDimensions)deviceDimensions;
- (PFAPFAEventMetadata)initWithDictionary:(id)a3;
- (PFAPFAEventMetadata)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)eventTimestampInMsSince1970;
- (unint64_t)hash;
- (void)deleteDeviceDimensions;
- (void)deleteEventTimestampInMsSince1970;
- (void)setDeviceDimensions:(id)a3;
- (void)setEventTimestampInMsSince1970:(unint64_t)a3;
- (void)setHasDeviceDimensions:(BOOL)a3;
- (void)setHasEventTimestampInMsSince1970:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAPFAEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PFAPFAEventMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PFAPFAEventMetadata *)self deviceDimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PFAPFAEventMetadata *)self deleteDeviceDimensions];
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

- (void)setHasDeviceDimensions:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setDeviceDimensions:(id)a3
{
}

- (PFAPFADeviceDimensions)deviceDimensions
{
  return self->_deviceDimensions;
}

- (unint64_t)eventTimestampInMsSince1970
{
  return self->_eventTimestampInMsSince1970;
}

- (PFAPFAEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PFAPFAEventMetadata;
  v5 = [(PFAPFAEventMetadata *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventTimestampInMsSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAPFAEventMetadata setEventTimestampInMsSince1970:](v5, "setEventTimestampInMsSince1970:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"deviceDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[PFAPFADeviceDimensions alloc] initWithDictionary:v7];
      [(PFAPFAEventMetadata *)v5 setDeviceDimensions:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (PFAPFAEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAPFAEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAPFAEventMetadata *)self dictionaryRepresentation];
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
  if (self->_deviceDimensions)
  {
    id v4 = [(PFAPFAEventMetadata *)self deviceDimensions];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"deviceDimensions"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"deviceDimensions"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PFAPFAEventMetadata eventTimestampInMsSince1970](self, "eventTimestampInMsSince1970"));
    [v3 setObject:v7 forKeyedSubscript:@"eventTimestampInMsSince1970"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_eventTimestampInMsSince1970;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(PFAPFADeviceDimensions *)self->_deviceDimensions hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (unint64_t eventTimestampInMsSince1970 = self->_eventTimestampInMsSince1970,
            eventTimestampInMsSince1970 == [v4 eventTimestampInMsSince1970]))
      {
        v6 = [(PFAPFAEventMetadata *)self deviceDimensions];
        uint64_t v7 = [v4 deviceDimensions];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(PFAPFAEventMetadata *)self deviceDimensions];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(PFAPFAEventMetadata *)self deviceDimensions];
          v12 = [v4 deviceDimensions];
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
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(PFAPFAEventMetadata *)self deviceDimensions];

  v5 = v7;
  if (v4)
  {
    v6 = [(PFAPFAEventMetadata *)self deviceDimensions];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAPFAEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteDeviceDimensions
{
}

- (BOOL)hasDeviceDimensions
{
  return self->_deviceDimensions != 0;
}

- (void)deleteEventTimestampInMsSince1970
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEventTimestampInMsSince1970:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventTimestampInMsSince1970
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEventTimestampInMsSince1970:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t eventTimestampInMsSince1970 = a3;
}

@end