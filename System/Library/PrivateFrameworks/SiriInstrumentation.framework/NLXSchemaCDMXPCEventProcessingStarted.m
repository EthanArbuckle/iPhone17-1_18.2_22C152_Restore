@interface NLXSchemaCDMXPCEventProcessingStarted
- (BOOL)hasProcessingType;
- (BOOL)hasServiceName;
- (BOOL)hasXpcSystemEventType;
- (BOOL)hasXpcType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMXPCEventProcessingStarted)initWithDictionary:(id)a3;
- (NLXSchemaCDMXPCEventProcessingStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)processingType;
- (int)serviceName;
- (int)xpcSystemEventType;
- (int)xpcType;
- (unint64_t)hash;
- (void)deleteProcessingType;
- (void)deleteServiceName;
- (void)deleteXpcSystemEventType;
- (void)deleteXpcType;
- (void)setHasProcessingType:(BOOL)a3;
- (void)setHasServiceName:(BOOL)a3;
- (void)setHasXpcSystemEventType:(BOOL)a3;
- (void)setHasXpcType:(BOOL)a3;
- (void)setProcessingType:(int)a3;
- (void)setServiceName:(int)a3;
- (void)setXpcSystemEventType:(int)a3;
- (void)setXpcType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMXPCEventProcessingStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)serviceName
{
  return self->_serviceName;
}

- (int)xpcSystemEventType
{
  return self->_xpcSystemEventType;
}

- (int)xpcType
{
  return self->_xpcType;
}

- (int)processingType
{
  return self->_processingType;
}

- (NLXSchemaCDMXPCEventProcessingStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMXPCEventProcessingStarted;
  v5 = [(NLXSchemaCDMXPCEventProcessingStarted *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"processingType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMXPCEventProcessingStarted setProcessingType:](v5, "setProcessingType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"xpcType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMXPCEventProcessingStarted setXpcType:](v5, "setXpcType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"xpcSystemEventType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMXPCEventProcessingStarted setXpcSystemEventType:](v5, "setXpcSystemEventType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"serviceName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMXPCEventProcessingStarted setServiceName:](v5, "setServiceName:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (NLXSchemaCDMXPCEventProcessingStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMXPCEventProcessingStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMXPCEventProcessingStarted *)self dictionaryRepresentation];
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
  if (has)
  {
    if ([(NLXSchemaCDMXPCEventProcessingStarted *)self processingType] == 1) {
      v9 = @"CDMXPCEVENTPROCESSINGTYPE_OVERRIDES_SETUP";
    }
    else {
      v9 = @"CDMXPCEVENTPROCESSINGTYPE_UNKNOWN";
    }
    [v3 setObject:v9 forKeyedSubscript:@"processingType"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v10 = [(NLXSchemaCDMXPCEventProcessingStarted *)self serviceName] - 1;
  if (v10 > 0x29) {
    v11 = @"CDMSERVICENAME_UNKNOWN";
  }
  else {
    v11 = off_1E5EBA520[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"serviceName"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_5;
  }
LABEL_22:
  unsigned int v12 = [(NLXSchemaCDMXPCEventProcessingStarted *)self xpcSystemEventType] - 1;
  if (v12 > 5) {
    v13 = @"CDMXPCSYSTEMEVENTTYPE_UNKNOWN";
  }
  else {
    v13 = off_1E5EBA670[v12];
  }
  [v3 setObject:v13 forKeyedSubscript:@"xpcSystemEventType"];
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_5:
  int v5 = [(NLXSchemaCDMXPCEventProcessingStarted *)self xpcType];
  v6 = @"CDMXPCTYPE_UNKNOWN";
  if (v5 == 1) {
    v6 = @"CDMXPCTYPE_EVENT";
  }
  if (v5 == 2) {
    uint64_t v7 = @"CDMXPCTYPE_ACTIVITY";
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"xpcType"];
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_processingType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_xpcType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_xpcSystemEventType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_serviceName;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $8C2E6E645F17E41EE561DA7A2FAE3C55 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int processingType = self->_processingType;
    if (processingType != [v4 processingType]) {
      goto LABEL_18;
    }
    $8C2E6E645F17E41EE561DA7A2FAE3C55 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    int xpcType = self->_xpcType;
    if (xpcType != [v4 xpcType]) {
      goto LABEL_18;
    }
    $8C2E6E645F17E41EE561DA7A2FAE3C55 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    int xpcSystemEventType = self->_xpcSystemEventType;
    if (xpcSystemEventType == [v4 xpcSystemEventType])
    {
      $8C2E6E645F17E41EE561DA7A2FAE3C55 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    int serviceName = self->_serviceName;
    if (serviceName != [v4 serviceName]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMXPCEventProcessingStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteServiceName
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasServiceName:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasServiceName
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setServiceName:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int serviceName = a3;
}

- (void)deleteXpcSystemEventType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasXpcSystemEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasXpcSystemEventType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setXpcSystemEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int xpcSystemEventType = a3;
}

- (void)deleteXpcType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasXpcType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasXpcType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setXpcType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int xpcType = a3;
}

- (void)deleteProcessingType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProcessingType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProcessingType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProcessingType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int processingType = a3;
}

@end