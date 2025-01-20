@interface FLOWSchemaFLOWSPORTSExecution
- (BOOL)hasIsDisambiguation;
- (BOOL)hasIsLiveScoreRequest;
- (BOOL)hasIsMachineUtterance;
- (BOOL)hasIsSnippetNextCardRequest;
- (BOOL)hasIsSportsWatchFaceRequest;
- (BOOL)hasSportsUsecase;
- (BOOL)isDisambiguation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLiveScoreRequest;
- (BOOL)isMachineUtterance;
- (BOOL)isSnippetNextCardRequest;
- (BOOL)isSportsWatchFaceRequest;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWSPORTSExecution)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWSPORTSExecution)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)sportsUsecase;
- (unint64_t)hash;
- (void)deleteIsDisambiguation;
- (void)deleteIsLiveScoreRequest;
- (void)deleteIsMachineUtterance;
- (void)deleteIsSnippetNextCardRequest;
- (void)deleteIsSportsWatchFaceRequest;
- (void)deleteSportsUsecase;
- (void)setHasIsDisambiguation:(BOOL)a3;
- (void)setHasIsLiveScoreRequest:(BOOL)a3;
- (void)setHasIsMachineUtterance:(BOOL)a3;
- (void)setHasIsSnippetNextCardRequest:(BOOL)a3;
- (void)setHasIsSportsWatchFaceRequest:(BOOL)a3;
- (void)setHasSportsUsecase:(BOOL)a3;
- (void)setIsDisambiguation:(BOOL)a3;
- (void)setIsLiveScoreRequest:(BOOL)a3;
- (void)setIsMachineUtterance:(BOOL)a3;
- (void)setIsSnippetNextCardRequest:(BOOL)a3;
- (void)setIsSportsWatchFaceRequest:(BOOL)a3;
- (void)setSportsUsecase:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWSPORTSExecution

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isLiveScoreRequest
{
  return self->_isLiveScoreRequest;
}

- (BOOL)isDisambiguation
{
  return self->_isDisambiguation;
}

- (BOOL)isMachineUtterance
{
  return self->_isMachineUtterance;
}

- (BOOL)isSnippetNextCardRequest
{
  return self->_isSnippetNextCardRequest;
}

- (BOOL)isSportsWatchFaceRequest
{
  return self->_isSportsWatchFaceRequest;
}

- (int)sportsUsecase
{
  return self->_sportsUsecase;
}

- (FLOWSchemaFLOWSPORTSExecution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FLOWSchemaFLOWSPORTSExecution;
  v5 = [(FLOWSchemaFLOWSPORTSExecution *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sportsUsecase"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSPORTSExecution setSportsUsecase:](v5, "setSportsUsecase:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isSportsWatchFaceRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSPORTSExecution setIsSportsWatchFaceRequest:](v5, "setIsSportsWatchFaceRequest:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isSnippetNextCardRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSPORTSExecution setIsSnippetNextCardRequest:](v5, "setIsSnippetNextCardRequest:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isMachineUtterance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSPORTSExecution setIsMachineUtterance:](v5, "setIsMachineUtterance:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isDisambiguation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSPORTSExecution setIsDisambiguation:](v5, "setIsDisambiguation:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isLiveScoreRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSPORTSExecution setIsLiveScoreRequest:](v5, "setIsLiveScoreRequest:", [v11 BOOLValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWSPORTSExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWSPORTSExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWSPORTSExecution *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 0x10) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSPORTSExecution isDisambiguation](self, "isDisambiguation"));
    [v3 setObject:v5 forKeyedSubscript:@"isDisambiguation"];

    char v4 = *(&self->_isLiveScoreRequest + 1);
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(&self->_isLiveScoreRequest + 1) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSPORTSExecution isLiveScoreRequest](self, "isLiveScoreRequest"));
  [v3 setObject:v6 forKeyedSubscript:@"isLiveScoreRequest"];

  char v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSPORTSExecution isMachineUtterance](self, "isMachineUtterance"));
  [v3 setObject:v7 forKeyedSubscript:@"isMachineUtterance"];

  char v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSPORTSExecution isSportsWatchFaceRequest](self, "isSportsWatchFaceRequest"));
    [v3 setObject:v9 forKeyedSubscript:@"isSportsWatchFaceRequest"];

    if (!*(&self->_isLiveScoreRequest + 1)) {
      goto LABEL_17;
    }
LABEL_13:
    unsigned int v10 = [(FLOWSchemaFLOWSPORTSExecution *)self sportsUsecase] - 1;
    if (v10 > 0x1E) {
      v11 = @"FLOWSPORTSUSECASE_UNKNOWN";
    }
    else {
      v11 = off_1E5EAFA50[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"sportsUsecase"];
    goto LABEL_17;
  }
LABEL_11:
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWSPORTSExecution isSnippetNextCardRequest](self, "isSnippetNextCardRequest"));
  [v3 setObject:v8 forKeyedSubscript:@"isSnippetNextCardRequest"];

  char v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 2) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if (v4) {
    goto LABEL_13;
  }
LABEL_17:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isLiveScoreRequest + 1))
  {
    uint64_t v2 = 2654435761 * self->_sportsUsecase;
    if ((*(&self->_isLiveScoreRequest + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isSportsWatchFaceRequest;
      if ((*(&self->_isLiveScoreRequest + 1) & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(&self->_isLiveScoreRequest + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(&self->_isLiveScoreRequest + 1) & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_isSnippetNextCardRequest;
    if ((*(&self->_isLiveScoreRequest + 1) & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(&self->_isLiveScoreRequest + 1) & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_isMachineUtterance;
    if ((*(&self->_isLiveScoreRequest + 1) & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(&self->_isLiveScoreRequest + 1) & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(&self->_isLiveScoreRequest + 1) & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_isDisambiguation;
  if ((*(&self->_isLiveScoreRequest + 1) & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_isLiveScoreRequest;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
  unsigned int v6 = v4[17];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (v5)
  {
    int sportsUsecase = self->_sportsUsecase;
    if (sportsUsecase != [v4 sportsUsecase]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
    unsigned int v6 = v4[17];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v8)
  {
    int isSportsWatchFaceRequest = self->_isSportsWatchFaceRequest;
    if (isSportsWatchFaceRequest != [v4 isSportsWatchFaceRequest]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
    unsigned int v6 = v4[17];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v10)
  {
    int isSnippetNextCardRequest = self->_isSnippetNextCardRequest;
    if (isSnippetNextCardRequest != [v4 isSnippetNextCardRequest]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
    unsigned int v6 = v4[17];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v12)
  {
    int isMachineUtterance = self->_isMachineUtterance;
    if (isMachineUtterance != [v4 isMachineUtterance]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
    unsigned int v6 = v4[17];
  }
  int v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_26;
  }
  if (v14)
  {
    int isDisambiguation = self->_isDisambiguation;
    if (isDisambiguation == [v4 isDisambiguation])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
      unsigned int v6 = v4[17];
      goto LABEL_22;
    }
LABEL_26:
    BOOL v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  int v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_26;
  }
  if (v16)
  {
    int isLiveScoreRequest = self->_isLiveScoreRequest;
    if (isLiveScoreRequest != [v4 isLiveScoreRequest]) {
      goto LABEL_26;
    }
  }
  BOOL v18 = 1;
LABEL_27:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char v4 = *(&self->_isLiveScoreRequest + 1);
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    char v4 = *(&self->_isLiveScoreRequest + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(&self->_isLiveScoreRequest + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_isLiveScoreRequest + 1) & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWSPORTSExecutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsLiveScoreRequest
{
  *(&self->_isLiveScoreRequest + 1) &= ~0x20u;
}

- (void)setHasIsLiveScoreRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xDF | v3;
}

- (BOOL)hasIsLiveScoreRequest
{
  return (*((unsigned __int8 *)&self->_isLiveScoreRequest + 1) >> 5) & 1;
}

- (void)setIsLiveScoreRequest:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 0x20u;
  self->_int isLiveScoreRequest = a3;
}

- (void)deleteIsDisambiguation
{
  *(&self->_isLiveScoreRequest + 1) &= ~0x10u;
}

- (void)setHasIsDisambiguation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xEF | v3;
}

- (BOOL)hasIsDisambiguation
{
  return (*((unsigned __int8 *)&self->_isLiveScoreRequest + 1) >> 4) & 1;
}

- (void)setIsDisambiguation:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 0x10u;
  self->_int isDisambiguation = a3;
}

- (void)deleteIsMachineUtterance
{
  *(&self->_isLiveScoreRequest + 1) &= ~8u;
}

- (void)setHasIsMachineUtterance:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xF7 | v3;
}

- (BOOL)hasIsMachineUtterance
{
  return (*((unsigned __int8 *)&self->_isLiveScoreRequest + 1) >> 3) & 1;
}

- (void)setIsMachineUtterance:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 8u;
  self->_int isMachineUtterance = a3;
}

- (void)deleteIsSnippetNextCardRequest
{
  *(&self->_isLiveScoreRequest + 1) &= ~4u;
}

- (void)setHasIsSnippetNextCardRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xFB | v3;
}

- (BOOL)hasIsSnippetNextCardRequest
{
  return (*((unsigned __int8 *)&self->_isLiveScoreRequest + 1) >> 2) & 1;
}

- (void)setIsSnippetNextCardRequest:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 4u;
  self->_int isSnippetNextCardRequest = a3;
}

- (void)deleteIsSportsWatchFaceRequest
{
  *(&self->_isLiveScoreRequest + 1) &= ~2u;
}

- (void)setHasIsSportsWatchFaceRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xFD | v3;
}

- (BOOL)hasIsSportsWatchFaceRequest
{
  return (*((unsigned __int8 *)&self->_isLiveScoreRequest + 1) >> 1) & 1;
}

- (void)setIsSportsWatchFaceRequest:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 2u;
  self->_int isSportsWatchFaceRequest = a3;
}

- (void)deleteSportsUsecase
{
  *(&self->_isLiveScoreRequest + 1) &= ~1u;
}

- (void)setHasSportsUsecase:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xFE | a3;
}

- (BOOL)hasSportsUsecase
{
  return *(&self->_isLiveScoreRequest + 1);
}

- (void)setSportsUsecase:(int)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 1u;
  self->_int sportsUsecase = a3;
}

@end