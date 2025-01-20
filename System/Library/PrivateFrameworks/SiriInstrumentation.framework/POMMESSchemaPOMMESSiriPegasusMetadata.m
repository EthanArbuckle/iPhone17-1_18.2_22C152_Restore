@interface POMMESSchemaPOMMESSiriPegasusMetadata
- (BOOL)hasDeviceState;
- (BOOL)hasInteractionType;
- (BOOL)hasIsCarplay;
- (BOOL)hasIsExplicitContentAllowed;
- (BOOL)hasIsInRestrictedSharingMode;
- (BOOL)hasIsWebContentDisabled;
- (BOOL)hasMovieRestriction;
- (BOOL)hasTvRestriction;
- (BOOL)isCarplay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContentAllowed;
- (BOOL)isInRestrictedSharingMode;
- (BOOL)isWebContentDisabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESDeviceState)deviceState;
- (POMMESSchemaPOMMESSiriPegasusMetadata)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESSiriPegasusMetadata)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)interactionType;
- (unint64_t)hash;
- (unsigned)movieRestriction;
- (unsigned)tvRestriction;
- (void)deleteDeviceState;
- (void)deleteInteractionType;
- (void)deleteIsCarplay;
- (void)deleteIsExplicitContentAllowed;
- (void)deleteIsInRestrictedSharingMode;
- (void)deleteIsWebContentDisabled;
- (void)deleteMovieRestriction;
- (void)deleteTvRestriction;
- (void)setDeviceState:(id)a3;
- (void)setHasDeviceState:(BOOL)a3;
- (void)setHasInteractionType:(BOOL)a3;
- (void)setHasIsCarplay:(BOOL)a3;
- (void)setHasIsExplicitContentAllowed:(BOOL)a3;
- (void)setHasIsInRestrictedSharingMode:(BOOL)a3;
- (void)setHasIsWebContentDisabled:(BOOL)a3;
- (void)setHasMovieRestriction:(BOOL)a3;
- (void)setHasTvRestriction:(BOOL)a3;
- (void)setInteractionType:(int)a3;
- (void)setIsCarplay:(BOOL)a3;
- (void)setIsExplicitContentAllowed:(BOOL)a3;
- (void)setIsInRestrictedSharingMode:(BOOL)a3;
- (void)setIsWebContentDisabled:(BOOL)a3;
- (void)setMovieRestriction:(unsigned int)a3;
- (void)setTvRestriction:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESSiriPegasusMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESSiriPegasusMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self deviceState];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(POMMESSchemaPOMMESSiriPegasusMetadata *)self deleteDeviceState];
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

- (void)setHasDeviceState:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setDeviceState:(id)a3
{
}

- (POMMESSchemaPOMMESDeviceState)deviceState
{
  return self->_deviceState;
}

- (BOOL)isWebContentDisabled
{
  return self->_isWebContentDisabled;
}

- (BOOL)isExplicitContentAllowed
{
  return self->_isExplicitContentAllowed;
}

- (BOOL)isInRestrictedSharingMode
{
  return self->_isInRestrictedSharingMode;
}

- (unsigned)tvRestriction
{
  return self->_tvRestriction;
}

- (unsigned)movieRestriction
{
  return self->_movieRestriction;
}

- (BOOL)isCarplay
{
  return self->_isCarplay;
}

- (int)interactionType
{
  return self->_interactionType;
}

- (POMMESSchemaPOMMESSiriPegasusMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)POMMESSchemaPOMMESSiriPegasusMetadata;
  v5 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"interactionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESSiriPegasusMetadata setInteractionType:](v5, "setInteractionType:", [v6 intValue]);
    }
    v17 = v6;
    v7 = [v4 objectForKeyedSubscript:@"isCarplay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESSiriPegasusMetadata setIsCarplay:](v5, "setIsCarplay:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"movieRestriction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESSiriPegasusMetadata setMovieRestriction:](v5, "setMovieRestriction:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"tvRestriction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESSiriPegasusMetadata setTvRestriction:](v5, "setTvRestriction:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isInRestrictedSharingMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESSiriPegasusMetadata setIsInRestrictedSharingMode:](v5, "setIsInRestrictedSharingMode:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isExplicitContentAllowed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESSiriPegasusMetadata setIsExplicitContentAllowed:](v5, "setIsExplicitContentAllowed:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"isWebContentDisabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESSiriPegasusMetadata setIsWebContentDisabled:](v5, "setIsWebContentDisabled:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"deviceState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [[POMMESSchemaPOMMESDeviceState alloc] initWithDictionary:v13];
      [(POMMESSchemaPOMMESSiriPegasusMetadata *)v5 setDeviceState:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESSiriPegasusMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self dictionaryRepresentation];
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
  if (self->_deviceState)
  {
    id v4 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self deviceState];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"deviceState"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"deviceState"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    int v8 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self interactionType];
    objc_super v9 = @"POMMESSIRIPEGASUSCONTEXTINTERACTIONTYPE_UNKNOWN";
    if (v8 == 1) {
      objc_super v9 = @"POMMESSIRIPEGASUSCONTEXTINTERACTIONTYPE_DIALOG_DRIVEN";
    }
    if (v8 == 2) {
      v10 = @"POMMESSIRIPEGASUSCONTEXTINTERACTIONTYPE_DISPLAY_DRIVEN";
    }
    else {
      v10 = v9;
    }
    [v3 setObject:v10 forKeyedSubscript:@"interactionType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESSiriPegasusMetadata isCarplay](self, "isCarplay"));
    [v3 setObject:v13 forKeyedSubscript:@"isCarplay"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_15:
      if ((has & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESSiriPegasusMetadata isExplicitContentAllowed](self, "isExplicitContentAllowed"));
  [v3 setObject:v14 forKeyedSubscript:@"isExplicitContentAllowed"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
LABEL_25:
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESSiriPegasusMetadata isInRestrictedSharingMode](self, "isInRestrictedSharingMode"));
  [v3 setObject:v15 forKeyedSubscript:@"isInRestrictedSharingMode"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_17:
    if ((has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_26:
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESSiriPegasusMetadata isWebContentDisabled](self, "isWebContentDisabled"));
  [v3 setObject:v16 forKeyedSubscript:@"isWebContentDisabled"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_27:
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESSiriPegasusMetadata movieRestriction](self, "movieRestriction"));
  [v3 setObject:v17 forKeyedSubscript:@"movieRestriction"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_19:
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESSiriPegasusMetadata tvRestriction](self, "tvRestriction"));
    [v3 setObject:v11 forKeyedSubscript:@"tvRestriction"];
  }
LABEL_20:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_interactionType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isCarplay;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_movieRestriction;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_tvRestriction;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_isInRestrictedSharingMode;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(POMMESSchemaPOMMESDeviceState *)self->_deviceState hash];
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_isExplicitContentAllowed;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_isWebContentDisabled;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(POMMESSchemaPOMMESDeviceState *)self->_deviceState hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  $B8A71575146586EC048264BA4BA2D3EB has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    int interactionType = self->_interactionType;
    if (interactionType != [v4 interactionType]) {
      goto LABEL_34;
    }
    $B8A71575146586EC048264BA4BA2D3EB has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int isCarplay = self->_isCarplay;
      if (isCarplay != [v4 isCarplay]) {
        goto LABEL_34;
      }
      $B8A71575146586EC048264BA4BA2D3EB has = self->_has;
      unsigned int v6 = v4[40];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        unsigned int movieRestriction = self->_movieRestriction;
        if (movieRestriction != [v4 movieRestriction]) {
          goto LABEL_34;
        }
        $B8A71575146586EC048264BA4BA2D3EB has = self->_has;
        unsigned int v6 = v4[40];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          unsigned int tvRestriction = self->_tvRestriction;
          if (tvRestriction != [v4 tvRestriction]) {
            goto LABEL_34;
          }
          $B8A71575146586EC048264BA4BA2D3EB has = self->_has;
          unsigned int v6 = v4[40];
        }
        int v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            int isInRestrictedSharingMode = self->_isInRestrictedSharingMode;
            if (isInRestrictedSharingMode != [v4 isInRestrictedSharingMode]) {
              goto LABEL_34;
            }
            $B8A71575146586EC048264BA4BA2D3EB has = self->_has;
            unsigned int v6 = v4[40];
          }
          int v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 == ((v6 >> 5) & 1))
          {
            if (v16)
            {
              int isExplicitContentAllowed = self->_isExplicitContentAllowed;
              if (isExplicitContentAllowed != [v4 isExplicitContentAllowed]) {
                goto LABEL_34;
              }
              $B8A71575146586EC048264BA4BA2D3EB has = self->_has;
              unsigned int v6 = v4[40];
            }
            int v18 = (*(unsigned int *)&has >> 6) & 1;
            if (v18 == ((v6 >> 6) & 1))
            {
              if (!v18
                || (int isWebContentDisabled = self->_isWebContentDisabled,
                    isWebContentDisabled == [v4 isWebContentDisabled]))
              {
                v20 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self deviceState];
                v21 = [v4 deviceState];
                v22 = v21;
                if ((v20 == 0) != (v21 != 0))
                {
                  uint64_t v23 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self deviceState];
                  if (!v23)
                  {

LABEL_37:
                    BOOL v28 = 1;
                    goto LABEL_35;
                  }
                  v24 = (void *)v23;
                  v25 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self deviceState];
                  v26 = [v4 deviceState];
                  char v27 = [v25 isEqual:v26];

                  if (v27) {
                    goto LABEL_37;
                  }
                }
                else
                {
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  BOOL v28 = 0;
LABEL_35:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
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
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  uint64_t v5 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self deviceState];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESSiriPegasusMetadata *)self deviceState];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESSiriPegasusMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteDeviceState
{
}

- (BOOL)hasDeviceState
{
  return self->_deviceState != 0;
}

- (void)deleteIsWebContentDisabled
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasIsWebContentDisabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsWebContentDisabled
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsWebContentDisabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int isWebContentDisabled = a3;
}

- (void)deleteIsExplicitContentAllowed
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIsExplicitContentAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsExplicitContentAllowed
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsExplicitContentAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isExplicitContentAllowed = a3;
}

- (void)deleteIsInRestrictedSharingMode
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasIsInRestrictedSharingMode:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsInRestrictedSharingMode
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsInRestrictedSharingMode:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int isInRestrictedSharingMode = a3;
}

- (void)deleteTvRestriction
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasTvRestriction:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTvRestriction
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTvRestriction:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int tvRestriction = a3;
}

- (void)deleteMovieRestriction
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMovieRestriction:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMovieRestriction
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMovieRestriction:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int movieRestriction = a3;
}

- (void)deleteIsCarplay
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsCarplay:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsCarplay
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsCarplay:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isCarplay = a3;
}

- (void)deleteInteractionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInteractionType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInteractionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInteractionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int interactionType = a3;
}

@end