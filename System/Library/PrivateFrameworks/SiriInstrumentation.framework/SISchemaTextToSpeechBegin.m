@interface SISchemaTextToSpeechBegin
- (BOOL)hasAceID;
- (BOOL)hasAudioOutputRoute;
- (BOOL)hasHardwareInterfaceVendorID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)aceID;
- (SISchemaHardwareInterfaceIdentifier)hardwareInterfaceVendorID;
- (SISchemaTextToSpeechBegin)initWithDictionary:(id)a3;
- (SISchemaTextToSpeechBegin)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioOutputRoute;
- (unint64_t)hash;
- (void)deleteAceID;
- (void)deleteAudioOutputRoute;
- (void)deleteHardwareInterfaceVendorID;
- (void)setAceID:(id)a3;
- (void)setAudioOutputRoute:(int)a3;
- (void)setHardwareInterfaceVendorID:(id)a3;
- (void)setHasAceID:(BOOL)a3;
- (void)setHasAudioOutputRoute:(BOOL)a3;
- (void)setHasHardwareInterfaceVendorID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaTextToSpeechBegin

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaTextToSpeechBegin;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaTextToSpeechBegin *)self hardwareInterfaceVendorID];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaTextToSpeechBegin *)self deleteHardwareInterfaceVendorID];
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
  objc_storeStrong((id *)&self->_hardwareInterfaceVendorID, 0);
  objc_storeStrong((id *)&self->_aceID, 0);
}

- (void)setHasHardwareInterfaceVendorID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAceID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHardwareInterfaceVendorID:(id)a3
{
}

- (SISchemaHardwareInterfaceIdentifier)hardwareInterfaceVendorID
{
  return self->_hardwareInterfaceVendorID;
}

- (int)audioOutputRoute
{
  return self->_audioOutputRoute;
}

- (void)setAceID:(id)a3
{
}

- (NSString)aceID
{
  return self->_aceID;
}

- (SISchemaTextToSpeechBegin)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaTextToSpeechBegin;
  v5 = [(SISchemaTextToSpeechBegin *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"aceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaTextToSpeechBegin *)v5 setAceID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"audioOutputRoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaTextToSpeechBegin setAudioOutputRoute:](v5, "setAudioOutputRoute:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"hardwareInterfaceVendorID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaHardwareInterfaceIdentifier alloc] initWithDictionary:v9];
      [(SISchemaTextToSpeechBegin *)v5 setHardwareInterfaceVendorID:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaTextToSpeechBegin)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaTextToSpeechBegin *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaTextToSpeechBegin *)self dictionaryRepresentation];
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
  if (self->_aceID)
  {
    id v4 = [(SISchemaTextToSpeechBegin *)self aceID];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"aceID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = [(SISchemaTextToSpeechBegin *)self audioOutputRoute] - 1;
    if (v6 > 6) {
      uint64_t v7 = @"AUDIOOUTPUTROUTE_UNKNOWN_AUDIO_OUTPUT_ROUTE";
    }
    else {
      uint64_t v7 = off_1E5EB85D8[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"audioOutputRoute"];
  }
  if (self->_hardwareInterfaceVendorID)
  {
    v8 = [(SISchemaTextToSpeechBegin *)self hardwareInterfaceVendorID];
    objc_super v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"hardwareInterfaceVendorID"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"hardwareInterfaceVendorID"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_aceID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_audioOutputRoute;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(SISchemaHardwareInterfaceIdentifier *)self->_hardwareInterfaceVendorID hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(SISchemaTextToSpeechBegin *)self aceID];
  unsigned int v6 = [v4 aceID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(SISchemaTextToSpeechBegin *)self aceID];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(SISchemaTextToSpeechBegin *)self aceID];
    v10 = [v4 aceID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int audioOutputRoute = self->_audioOutputRoute;
    if (audioOutputRoute != [v4 audioOutputRoute]) {
      goto LABEL_15;
    }
  }
  v5 = [(SISchemaTextToSpeechBegin *)self hardwareInterfaceVendorID];
  unsigned int v6 = [v4 hardwareInterfaceVendorID];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(SISchemaTextToSpeechBegin *)self hardwareInterfaceVendorID];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(SISchemaTextToSpeechBegin *)self hardwareInterfaceVendorID];
    v16 = [v4 hardwareInterfaceVendorID];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(SISchemaTextToSpeechBegin *)self aceID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(SISchemaTextToSpeechBegin *)self hardwareInterfaceVendorID];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(SISchemaTextToSpeechBegin *)self hardwareInterfaceVendorID];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaTextToSpeechBeginReadFrom(self, (uint64_t)a3);
}

- (void)deleteHardwareInterfaceVendorID
{
}

- (BOOL)hasHardwareInterfaceVendorID
{
  return self->_hardwareInterfaceVendorID != 0;
}

- (void)deleteAudioOutputRoute
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioOutputRoute:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioOutputRoute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioOutputRoute:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int audioOutputRoute = a3;
}

- (void)deleteAceID
{
}

- (BOOL)hasAceID
{
  return self->_aceID != 0;
}

@end