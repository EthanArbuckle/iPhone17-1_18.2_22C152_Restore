@interface SISchemaAudioFirstBufferRecorded
- (BOOL)hasAudioInputRoute;
- (BOOL)hasHardwareInterfaceVendorID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaAudioFirstBufferRecorded)initWithDictionary:(id)a3;
- (SISchemaAudioFirstBufferRecorded)initWithJSON:(id)a3;
- (SISchemaHardwareInterfaceIdentifier)hardwareInterfaceVendorID;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioInputRoute;
- (unint64_t)hash;
- (void)deleteAudioInputRoute;
- (void)deleteHardwareInterfaceVendorID;
- (void)setAudioInputRoute:(int)a3;
- (void)setHardwareInterfaceVendorID:(id)a3;
- (void)setHasAudioInputRoute:(BOOL)a3;
- (void)setHasHardwareInterfaceVendorID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaAudioFirstBufferRecorded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaAudioFirstBufferRecorded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaAudioFirstBufferRecorded *)self hardwareInterfaceVendorID];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaAudioFirstBufferRecorded *)self deleteHardwareInterfaceVendorID];
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

- (void)setHasHardwareInterfaceVendorID:(BOOL)a3
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

- (int)audioInputRoute
{
  return self->_audioInputRoute;
}

- (SISchemaAudioFirstBufferRecorded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaAudioFirstBufferRecorded;
  v5 = [(SISchemaAudioFirstBufferRecorded *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioInputRoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAudioFirstBufferRecorded setAudioInputRoute:](v5, "setAudioInputRoute:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"hardwareInterfaceVendorID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[SISchemaHardwareInterfaceIdentifier alloc] initWithDictionary:v7];
      [(SISchemaAudioFirstBufferRecorded *)v5 setHardwareInterfaceVendorID:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (SISchemaAudioFirstBufferRecorded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaAudioFirstBufferRecorded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaAudioFirstBufferRecorded *)self dictionaryRepresentation];
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
    unsigned int v4 = [(SISchemaAudioFirstBufferRecorded *)self audioInputRoute] - 1;
    if (v4 > 0xD) {
      v5 = @"AUDIOINPUTROUTE_UNKNOWN_AUDIO_INPUT_ROUTE";
    }
    else {
      v5 = off_1E5EB56D8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioInputRoute"];
  }
  if (self->_hardwareInterfaceVendorID)
  {
    v6 = [(SISchemaAudioFirstBufferRecorded *)self hardwareInterfaceVendorID];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"hardwareInterfaceVendorID"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"hardwareInterfaceVendorID"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_audioInputRoute;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(SISchemaHardwareInterfaceIdentifier *)self->_hardwareInterfaceVendorID hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int audioInputRoute = self->_audioInputRoute,
            audioInputRoute == [v4 audioInputRoute]))
      {
        v6 = [(SISchemaAudioFirstBufferRecorded *)self hardwareInterfaceVendorID];
        uint64_t v7 = [v4 hardwareInterfaceVendorID];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(SISchemaAudioFirstBufferRecorded *)self hardwareInterfaceVendorID];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(SISchemaAudioFirstBufferRecorded *)self hardwareInterfaceVendorID];
          v12 = [v4 hardwareInterfaceVendorID];
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
  unsigned int v4 = [(SISchemaAudioFirstBufferRecorded *)self hardwareInterfaceVendorID];

  v5 = v7;
  if (v4)
  {
    v6 = [(SISchemaAudioFirstBufferRecorded *)self hardwareInterfaceVendorID];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAudioFirstBufferRecordedReadFrom(self, (uint64_t)a3);
}

- (void)deleteHardwareInterfaceVendorID
{
}

- (BOOL)hasHardwareInterfaceVendorID
{
  return self->_hardwareInterfaceVendorID != 0;
}

- (void)deleteAudioInputRoute
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioInputRoute:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioInputRoute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioInputRoute:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int audioInputRoute = a3;
}

@end