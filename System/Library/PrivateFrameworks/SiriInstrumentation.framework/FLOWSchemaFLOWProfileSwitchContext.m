@interface FLOWSchemaFLOWProfileSwitchContext
- (BOOL)hasProfileSwitchByNameType;
- (BOOL)hasProfileSwitchDurationInMs;
- (BOOL)hasProfileSwitchFailureReason;
- (BOOL)hasProfileSwitchMethod;
- (BOOL)hasProfileSwitchOutcome;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWProfileSwitchContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWProfileSwitchContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)profileSwitchByNameType;
- (int)profileSwitchFailureReason;
- (int)profileSwitchMethod;
- (int)profileSwitchOutcome;
- (unint64_t)hash;
- (unsigned)profileSwitchDurationInMs;
- (void)deleteProfileSwitchByNameType;
- (void)deleteProfileSwitchDurationInMs;
- (void)deleteProfileSwitchFailureReason;
- (void)deleteProfileSwitchMethod;
- (void)deleteProfileSwitchOutcome;
- (void)setHasProfileSwitchByNameType:(BOOL)a3;
- (void)setHasProfileSwitchDurationInMs:(BOOL)a3;
- (void)setHasProfileSwitchFailureReason:(BOOL)a3;
- (void)setHasProfileSwitchMethod:(BOOL)a3;
- (void)setHasProfileSwitchOutcome:(BOOL)a3;
- (void)setProfileSwitchByNameType:(int)a3;
- (void)setProfileSwitchDurationInMs:(unsigned int)a3;
- (void)setProfileSwitchFailureReason:(int)a3;
- (void)setProfileSwitchMethod:(int)a3;
- (void)setProfileSwitchOutcome:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWProfileSwitchContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)profileSwitchDurationInMs
{
  return self->_profileSwitchDurationInMs;
}

- (int)profileSwitchFailureReason
{
  return self->_profileSwitchFailureReason;
}

- (int)profileSwitchOutcome
{
  return self->_profileSwitchOutcome;
}

- (int)profileSwitchByNameType
{
  return self->_profileSwitchByNameType;
}

- (int)profileSwitchMethod
{
  return self->_profileSwitchMethod;
}

- (FLOWSchemaFLOWProfileSwitchContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWProfileSwitchContext;
  v5 = [(FLOWSchemaFLOWProfileSwitchContext *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"profileSwitchMethod"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchMethod:](v5, "setProfileSwitchMethod:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"profileSwitchByNameType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchByNameType:](v5, "setProfileSwitchByNameType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"profileSwitchOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchOutcome:](v5, "setProfileSwitchOutcome:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"profileSwitchFailureReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchFailureReason:](v5, "setProfileSwitchFailureReason:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"profileSwitchDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchDurationInMs:](v5, "setProfileSwitchDurationInMs:", [v10 unsignedIntValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWProfileSwitchContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWProfileSwitchContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWProfileSwitchContext *)self dictionaryRepresentation];
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
    unsigned int v9 = [(FLOWSchemaFLOWProfileSwitchContext *)self profileSwitchByNameType] - 1;
    if (v9 > 7) {
      v10 = @"FLOWPROFILESWITCHBYNAMETYPE_UNKNOWN";
    }
    else {
      v10 = off_1E5EAF9D8[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"profileSwitchByNameType"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWProfileSwitchContext profileSwitchDurationInMs](self, "profileSwitchDurationInMs"));
  [v3 setObject:v11 forKeyedSubscript:@"profileSwitchDurationInMs"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_20:
  unsigned int v12 = [(FLOWSchemaFLOWProfileSwitchContext *)self profileSwitchFailureReason] - 1;
  if (v12 > 3) {
    objc_super v13 = @"FLOWPROFILESWITCHFAILUREREASON_UNKNOWN";
  }
  else {
    objc_super v13 = off_1E5EAFA18[v12];
  }
  [v3 setObject:v13 forKeyedSubscript:@"profileSwitchFailureReason"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_6;
  }
LABEL_24:
  unsigned int v14 = [(FLOWSchemaFLOWProfileSwitchContext *)self profileSwitchMethod] - 1;
  if (v14 > 2) {
    v15 = @"FLOWPROFILESWITCHMETHOD_UNKNOWN";
  }
  else {
    v15 = off_1E5EAFA38[v14];
  }
  [v3 setObject:v15 forKeyedSubscript:@"profileSwitchMethod"];
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  int v5 = [(FLOWSchemaFLOWProfileSwitchContext *)self profileSwitchOutcome];
  v6 = @"FLOWPROFILESWITCHOUTCOME_UNKNOWN";
  if (v5 == 1) {
    v6 = @"FLOWPROFILESWITCHOUTCOME_SUCCESS";
  }
  if (v5 == 2) {
    uint64_t v7 = @"FLOWPROFILESWITCHOUTCOME_FAILURE";
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"profileSwitchOutcome"];
LABEL_12:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_profileSwitchMethod;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_profileSwitchByNameType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
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
    uint64_t v4 = 2654435761 * self->_profileSwitchOutcome;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_profileSwitchFailureReason;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_profileSwitchDurationInMs;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $DFC4F393206D581EC1D2F97C42C2F712 has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    int profileSwitchMethod = self->_profileSwitchMethod;
    if (profileSwitchMethod != [v4 profileSwitchMethod]) {
      goto LABEL_22;
    }
    $DFC4F393206D581EC1D2F97C42C2F712 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    int profileSwitchByNameType = self->_profileSwitchByNameType;
    if (profileSwitchByNameType != [v4 profileSwitchByNameType]) {
      goto LABEL_22;
    }
    $DFC4F393206D581EC1D2F97C42C2F712 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    int profileSwitchOutcome = self->_profileSwitchOutcome;
    if (profileSwitchOutcome != [v4 profileSwitchOutcome]) {
      goto LABEL_22;
    }
    $DFC4F393206D581EC1D2F97C42C2F712 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    int profileSwitchFailureReason = self->_profileSwitchFailureReason;
    if (profileSwitchFailureReason == [v4 profileSwitchFailureReason])
    {
      $DFC4F393206D581EC1D2F97C42C2F712 has = self->_has;
      unsigned int v6 = v4[28];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    unsigned int profileSwitchDurationInMs = self->_profileSwitchDurationInMs;
    if (profileSwitchDurationInMs != [v4 profileSwitchDurationInMs]) {
      goto LABEL_22;
    }
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
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
      goto LABEL_12;
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
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWProfileSwitchContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteProfileSwitchDurationInMs
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasProfileSwitchDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasProfileSwitchDurationInMs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setProfileSwitchDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int profileSwitchDurationInMs = a3;
}

- (void)deleteProfileSwitchFailureReason
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasProfileSwitchFailureReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasProfileSwitchFailureReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setProfileSwitchFailureReason:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int profileSwitchFailureReason = a3;
}

- (void)deleteProfileSwitchOutcome
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasProfileSwitchOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProfileSwitchOutcome
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProfileSwitchOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int profileSwitchOutcome = a3;
}

- (void)deleteProfileSwitchByNameType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasProfileSwitchByNameType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProfileSwitchByNameType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setProfileSwitchByNameType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int profileSwitchByNameType = a3;
}

- (void)deleteProfileSwitchMethod
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProfileSwitchMethod:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProfileSwitchMethod
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProfileSwitchMethod:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int profileSwitchMethod = a3;
}

@end