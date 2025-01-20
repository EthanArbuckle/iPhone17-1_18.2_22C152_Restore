@interface SISchemaBluetoothCarPreferredAudioRouteChanged
- (BOOL)hasAfter;
- (BOOL)hasBefore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaBluetoothCarPreferredAudioRouteChanged)initWithDictionary:(id)a3;
- (SISchemaBluetoothCarPreferredAudioRouteChanged)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)after;
- (int)before;
- (unint64_t)hash;
- (void)deleteAfter;
- (void)deleteBefore;
- (void)setAfter:(int)a3;
- (void)setBefore:(int)a3;
- (void)setHasAfter:(BOOL)a3;
- (void)setHasBefore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaBluetoothCarPreferredAudioRouteChanged

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)after
{
  return self->_after;
}

- (int)before
{
  return self->_before;
}

- (SISchemaBluetoothCarPreferredAudioRouteChanged)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaBluetoothCarPreferredAudioRouteChanged;
  v5 = [(SISchemaBluetoothCarPreferredAudioRouteChanged *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"before"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaBluetoothCarPreferredAudioRouteChanged setBefore:](v5, "setBefore:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"after"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaBluetoothCarPreferredAudioRouteChanged setAfter:](v5, "setAfter:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (SISchemaBluetoothCarPreferredAudioRouteChanged)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaBluetoothCarPreferredAudioRouteChanged *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaBluetoothCarPreferredAudioRouteChanged *)self dictionaryRepresentation];
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
    int v5 = [(SISchemaBluetoothCarPreferredAudioRouteChanged *)self after];
    if (v5 == 1) {
      v6 = @"BLUETOOTHCARPREFERREDAUDIOROUTE_A2DP";
    }
    else {
      v6 = @"BLUETOOTHCARPREFERREDAUDIOROUTE_HFP";
    }
    if (v5 == 2) {
      uint64_t v7 = @"BLUETOOTHCARPREFERREDAUDIOROUTE_DEVICE_SPEAKER";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"after"];
    char has = (char)self->_has;
  }
  if (has)
  {
    int v8 = [(SISchemaBluetoothCarPreferredAudioRouteChanged *)self before];
    if (v8 == 1) {
      v9 = @"BLUETOOTHCARPREFERREDAUDIOROUTE_A2DP";
    }
    else {
      v9 = @"BLUETOOTHCARPREFERREDAUDIOROUTE_HFP";
    }
    if (v8 == 2) {
      objc_super v10 = @"BLUETOOTHCARPREFERREDAUDIOROUTE_DEVICE_SPEAKER";
    }
    else {
      objc_super v10 = v9;
    }
    [v3 setObject:v10 forKeyedSubscript:@"before"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_before;
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
  uint64_t v3 = 2654435761 * self->_after;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $43FB4E6D12EE2CED69525A5FE2200D2F has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int before = self->_before;
    if (before != [v4 before])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $43FB4E6D12EE2CED69525A5FE2200D2F has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int after = self->_after;
    if (after != [v4 after]) {
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
  return SISchemaBluetoothCarPreferredAudioRouteChangedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAfter
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAfter:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAfter
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAfter:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int after = a3;
}

- (void)deleteBefore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasBefore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBefore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBefore:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int before = a3;
}

@end