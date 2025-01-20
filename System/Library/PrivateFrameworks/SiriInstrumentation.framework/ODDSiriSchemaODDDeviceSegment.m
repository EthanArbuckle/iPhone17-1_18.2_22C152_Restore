@interface ODDSiriSchemaODDDeviceSegment
- (BOOL)hasSegmentDataAvailabilityState;
- (BOOL)hasSegmentType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDDeviceSegment)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDeviceSegment)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)segmentDataAvailabilityState;
- (int)segmentType;
- (unint64_t)hash;
- (void)deleteSegmentDataAvailabilityState;
- (void)deleteSegmentType;
- (void)setHasSegmentDataAvailabilityState:(BOOL)a3;
- (void)setHasSegmentType:(BOOL)a3;
- (void)setSegmentDataAvailabilityState:(int)a3;
- (void)setSegmentType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDeviceSegment

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)segmentDataAvailabilityState
{
  return self->_segmentDataAvailabilityState;
}

- (int)segmentType
{
  return self->_segmentType;
}

- (ODDSiriSchemaODDDeviceSegment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ODDSiriSchemaODDDeviceSegment;
  v5 = [(ODDSiriSchemaODDDeviceSegment *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"segmentType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceSegment setSegmentType:](v5, "setSegmentType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"segmentDataAvailabilityState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceSegment setSegmentDataAvailabilityState:](v5, "setSegmentDataAvailabilityState:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDeviceSegment)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDeviceSegment *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDeviceSegment *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    int v5 = [(ODDSiriSchemaODDDeviceSegment *)self segmentDataAvailabilityState];
    v6 = @"ODDDATAAVAILABILITYSTATE_UNKNOWN";
    if (v5 == 1) {
      v6 = @"ODDDATAAVAILABILITYSTATE_COMPLETE";
    }
    if (v5 == 2) {
      uint64_t v7 = @"ODDDATAAVAILABILITYSTATE_INSUFFICIENT_DATA";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"segmentDataAvailabilityState"];
    char has = (char)self->_has;
  }
  if (has)
  {
    int v8 = [(ODDSiriSchemaODDDeviceSegment *)self segmentType];
    v9 = @"ODDDEVICESEGMENTTYPE_UNKNOWN";
    if (v8 == 1) {
      v9 = @"ODDDEVICESEGMENTTYPE_NONE";
    }
    if (v8 == 2) {
      objc_super v10 = @"ODDDEVICESEGMENTTYPE_ASSISTANT_2X3";
    }
    else {
      objc_super v10 = v9;
    }
    [v3 setObject:v10 forKeyedSubscript:@"segmentType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_segmentType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_segmentDataAvailabilityState;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $02F4D335578A6ECA27C9E49D1443F8CC has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int segmentType = self->_segmentType;
    if (segmentType != [v4 segmentType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $02F4D335578A6ECA27C9E49D1443F8CC has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int segmentDataAvailabilityState = self->_segmentDataAvailabilityState;
    if (segmentDataAvailabilityState != [v4 segmentDataAvailabilityState]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDeviceSegmentReadFrom(self, (uint64_t)a3);
}

- (void)deleteSegmentDataAvailabilityState
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSegmentDataAvailabilityState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSegmentDataAvailabilityState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSegmentDataAvailabilityState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int segmentDataAvailabilityState = a3;
}

- (void)deleteSegmentType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSegmentType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSegmentType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSegmentType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int segmentType = a3;
}

@end