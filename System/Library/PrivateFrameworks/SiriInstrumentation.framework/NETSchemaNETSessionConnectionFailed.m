@interface NETSchemaNETSessionConnectionFailed
- (BOOL)hasConnectionMode;
- (BOOL)hasConnectionType;
- (BOOL)hasError;
- (BOOL)hasIsDormant;
- (BOOL)hasIsWwanPreferred;
- (BOOL)hasNetworkSessionState;
- (BOOL)hasPolicyId;
- (BOOL)hasSendBufferSize;
- (BOOL)hasSessionType;
- (BOOL)hasUnderlyingError;
- (BOOL)isDormant;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWwanPreferred;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETError)error;
- (NETSchemaNETError)underlyingError;
- (NETSchemaNETSessionConnectionFailed)initWithDictionary:(id)a3;
- (NETSchemaNETSessionConnectionFailed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)policyId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)connectionMode;
- (int)connectionType;
- (int)networkSessionState;
- (int)sessionType;
- (unint64_t)hash;
- (unint64_t)sendBufferSize;
- (void)deleteConnectionMode;
- (void)deleteConnectionType;
- (void)deleteError;
- (void)deleteIsDormant;
- (void)deleteIsWwanPreferred;
- (void)deleteNetworkSessionState;
- (void)deletePolicyId;
- (void)deleteSendBufferSize;
- (void)deleteSessionType;
- (void)deleteUnderlyingError;
- (void)setConnectionMode:(int)a3;
- (void)setConnectionType:(int)a3;
- (void)setError:(id)a3;
- (void)setHasConnectionMode:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasIsDormant:(BOOL)a3;
- (void)setHasIsWwanPreferred:(BOOL)a3;
- (void)setHasNetworkSessionState:(BOOL)a3;
- (void)setHasPolicyId:(BOOL)a3;
- (void)setHasSendBufferSize:(BOOL)a3;
- (void)setHasSessionType:(BOOL)a3;
- (void)setHasUnderlyingError:(BOOL)a3;
- (void)setIsDormant:(BOOL)a3;
- (void)setIsWwanPreferred:(BOOL)a3;
- (void)setNetworkSessionState:(int)a3;
- (void)setPolicyId:(id)a3;
- (void)setSendBufferSize:(unint64_t)a3;
- (void)setSessionType:(int)a3;
- (void)setUnderlyingError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETSessionConnectionFailed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NETSchemaNETSessionConnectionFailed;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(NETSchemaNETSessionConnectionFailed *)self error];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NETSchemaNETSessionConnectionFailed *)self deleteError];
  }
  v9 = [(NETSchemaNETSessionConnectionFailed *)self underlyingError];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NETSchemaNETSessionConnectionFailed *)self deleteUnderlyingError];
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
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_policyId, 0);
}

- (void)setHasUnderlyingError:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasError:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasPolicyId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setUnderlyingError:(id)a3
{
}

- (NETSchemaNETError)underlyingError
{
  return self->_underlyingError;
}

- (void)setError:(id)a3
{
}

- (NETSchemaNETError)error
{
  return self->_error;
}

- (void)setPolicyId:(id)a3
{
}

- (NSString)policyId
{
  return self->_policyId;
}

- (unint64_t)sendBufferSize
{
  return self->_sendBufferSize;
}

- (BOOL)isDormant
{
  return self->_isDormant;
}

- (BOOL)isWwanPreferred
{
  return self->_isWwanPreferred;
}

- (int)networkSessionState
{
  return self->_networkSessionState;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (int)connectionMode
{
  return self->_connectionMode;
}

- (int)connectionType
{
  return self->_connectionType;
}

- (NETSchemaNETSessionConnectionFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NETSchemaNETSessionConnectionFailed;
  v5 = [(NETSchemaNETSessionConnectionFailed *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"connectionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionFailed setConnectionType:](v5, "setConnectionType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"connectionMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionFailed setConnectionMode:](v5, "setConnectionMode:", [v7 intValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"sessionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionFailed setSessionType:](v5, "setSessionType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"networkSessionState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionFailed setNetworkSessionState:](v5, "setNetworkSessionState:", [v9 intValue]);
    }
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isWwanPreferred", v9);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionFailed setIsWwanPreferred:](v5, "setIsWwanPreferred:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"isDormant"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionFailed setIsDormant:](v5, "setIsDormant:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"sendBufferSize"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionFailed setSendBufferSize:](v5, "setSendBufferSize:", [v12 unsignedLongLongValue]);
    }
    v22 = v7;
    v23 = v6;
    objc_super v13 = [v4 objectForKeyedSubscript:@"policyId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(NETSchemaNETSessionConnectionFailed *)v5 setPolicyId:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[NETSchemaNETError alloc] initWithDictionary:v15];
      [(NETSchemaNETSessionConnectionFailed *)v5 setError:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"underlyingError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[NETSchemaNETError alloc] initWithDictionary:v17];
      [(NETSchemaNETSessionConnectionFailed *)v5 setUnderlyingError:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (NETSchemaNETSessionConnectionFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETSessionConnectionFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETSessionConnectionFailed *)self dictionaryRepresentation];
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
    int v5 = [(NETSchemaNETSessionConnectionFailed *)self connectionMode];
    v6 = @"NETCONNECTIONMODE_UNKNOWN";
    if (v5 == 1) {
      v6 = @"NETCONNECTIONMODE_ASSISTANT";
    }
    if (v5 == 2) {
      uint64_t v7 = @"NETCONNECTIONMODE_ASSISTANT_AND_DICTATION";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"connectionMode"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v8 = [(NETSchemaNETSessionConnectionFailed *)self connectionType] - 1;
    if (v8 > 0x16) {
      v9 = @"NETCONNECTIONTYPE_UNKNOWN";
    }
    else {
      v9 = off_1E5EB2A50[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"connectionType"];
  }
  if (self->_error)
  {
    v10 = [(NETSchemaNETSessionConnectionFailed *)self error];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"error"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"error"];
    }
  }
  char v13 = (char)self->_has;
  if ((v13 & 0x20) != 0)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETSessionConnectionFailed isDormant](self, "isDormant"));
    [v3 setObject:v14 forKeyedSubscript:@"isDormant"];

    char v13 = (char)self->_has;
    if ((v13 & 0x10) == 0)
    {
LABEL_20:
      if ((v13 & 8) == 0) {
        goto LABEL_28;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_20;
  }
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETSessionConnectionFailed isWwanPreferred](self, "isWwanPreferred"));
  [v3 setObject:v15 forKeyedSubscript:@"isWwanPreferred"];

  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_28;
  }
LABEL_24:
  unsigned int v16 = [(NETSchemaNETSessionConnectionFailed *)self networkSessionState] - 1;
  if (v16 > 0xB) {
    v17 = @"NETSESSIONSTATE_UNKNOWN";
  }
  else {
    v17 = off_1E5EB2B08[v16];
  }
  [v3 setObject:v17 forKeyedSubscript:@"networkSessionState"];
LABEL_28:
  if (self->_policyId)
  {
    v18 = [(NETSchemaNETSessionConnectionFailed *)self policyId];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"policyId"];
  }
  char v20 = (char)self->_has;
  if ((v20 & 0x40) != 0)
  {
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionFailed sendBufferSize](self, "sendBufferSize"));
    [v3 setObject:v21 forKeyedSubscript:@"sendBufferSize"];

    char v20 = (char)self->_has;
  }
  if ((v20 & 4) != 0)
  {
    unsigned int v22 = [(NETSchemaNETSessionConnectionFailed *)self sessionType] - 1;
    if (v22 > 3) {
      v23 = @"NETSESSIONTYPE_UNKNOWN";
    }
    else {
      v23 = off_1E5EB2B68[v22];
    }
    [v3 setObject:v23 forKeyedSubscript:@"sessionType"];
  }
  if (self->_underlyingError)
  {
    objc_super v24 = [(NETSchemaNETSessionConnectionFailed *)self underlyingError];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"underlyingError"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"underlyingError"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_connectionType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_connectionMode;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_sessionType;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_networkSessionState;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_isWwanPreferred;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    unint64_t v9 = 0;
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_isDormant;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  unint64_t v9 = 2654435761u * self->_sendBufferSize;
LABEL_16:
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_policyId hash];
  unint64_t v11 = [(NETSchemaNETError *)self->_error hash];
  return v10 ^ v11 ^ [(NETSchemaNETError *)self->_underlyingError hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  $655415CA7B26D733E92EE4F5528365C3 has = self->_has;
  unsigned int v6 = v4[64];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_44;
  }
  if (*(unsigned char *)&has)
  {
    int connectionType = self->_connectionType;
    if (connectionType != [v4 connectionType]) {
      goto LABEL_44;
    }
    $655415CA7B26D733E92EE4F5528365C3 has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int connectionMode = self->_connectionMode;
      if (connectionMode != [v4 connectionMode]) {
        goto LABEL_44;
      }
      $655415CA7B26D733E92EE4F5528365C3 has = self->_has;
      unsigned int v6 = v4[64];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int sessionType = self->_sessionType;
        if (sessionType != [v4 sessionType]) {
          goto LABEL_44;
        }
        $655415CA7B26D733E92EE4F5528365C3 has = self->_has;
        unsigned int v6 = v4[64];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          int networkSessionState = self->_networkSessionState;
          if (networkSessionState != [v4 networkSessionState]) {
            goto LABEL_44;
          }
          $655415CA7B26D733E92EE4F5528365C3 has = self->_has;
          unsigned int v6 = v4[64];
        }
        int v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            int isWwanPreferred = self->_isWwanPreferred;
            if (isWwanPreferred != [v4 isWwanPreferred]) {
              goto LABEL_44;
            }
            $655415CA7B26D733E92EE4F5528365C3 has = self->_has;
            unsigned int v6 = v4[64];
          }
          int v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 == ((v6 >> 5) & 1))
          {
            if (v16)
            {
              int isDormant = self->_isDormant;
              if (isDormant != [v4 isDormant]) {
                goto LABEL_44;
              }
              $655415CA7B26D733E92EE4F5528365C3 has = self->_has;
              unsigned int v6 = v4[64];
            }
            int v18 = (*(unsigned int *)&has >> 6) & 1;
            if (v18 != ((v6 >> 6) & 1)) {
              goto LABEL_44;
            }
            if (v18)
            {
              unint64_t sendBufferSize = self->_sendBufferSize;
              if (sendBufferSize != [v4 sendBufferSize]) {
                goto LABEL_44;
              }
            }
            char v20 = [(NETSchemaNETSessionConnectionFailed *)self policyId];
            v21 = [v4 policyId];
            if ((v20 == 0) == (v21 != 0)) {
              goto LABEL_43;
            }
            uint64_t v22 = [(NETSchemaNETSessionConnectionFailed *)self policyId];
            if (v22)
            {
              v23 = (void *)v22;
              objc_super v24 = [(NETSchemaNETSessionConnectionFailed *)self policyId];
              v25 = [v4 policyId];
              int v26 = [v24 isEqual:v25];

              if (!v26) {
                goto LABEL_44;
              }
            }
            else
            {
            }
            char v20 = [(NETSchemaNETSessionConnectionFailed *)self error];
            v21 = [v4 error];
            if ((v20 == 0) == (v21 != 0)) {
              goto LABEL_43;
            }
            uint64_t v27 = [(NETSchemaNETSessionConnectionFailed *)self error];
            if (v27)
            {
              v28 = (void *)v27;
              v29 = [(NETSchemaNETSessionConnectionFailed *)self error];
              v30 = [v4 error];
              int v31 = [v29 isEqual:v30];

              if (!v31) {
                goto LABEL_44;
              }
            }
            else
            {
            }
            char v20 = [(NETSchemaNETSessionConnectionFailed *)self underlyingError];
            v21 = [v4 underlyingError];
            if ((v20 == 0) != (v21 != 0))
            {
              uint64_t v32 = [(NETSchemaNETSessionConnectionFailed *)self underlyingError];
              if (!v32)
              {

LABEL_47:
                BOOL v37 = 1;
                goto LABEL_45;
              }
              v33 = (void *)v32;
              v34 = [(NETSchemaNETSessionConnectionFailed *)self underlyingError];
              v35 = [v4 underlyingError];
              char v36 = [v34 isEqual:v35];

              if (v36) {
                goto LABEL_47;
              }
            }
            else
            {
LABEL_43:
            }
          }
        }
      }
    }
  }
LABEL_44:
  BOOL v37 = 0;
LABEL_45:

  return v37;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
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
      goto LABEL_20;
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
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
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
LABEL_23:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint64Field();
LABEL_9:
  uint64_t v5 = [(NETSchemaNETSessionConnectionFailed *)self policyId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unsigned int v6 = [(NETSchemaNETSessionConnectionFailed *)self error];

  if (v6)
  {
    uint64_t v7 = [(NETSchemaNETSessionConnectionFailed *)self error];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(NETSchemaNETSessionConnectionFailed *)self underlyingError];

  unint64_t v9 = v11;
  if (v8)
  {
    int v10 = [(NETSchemaNETSessionConnectionFailed *)self underlyingError];
    PBDataWriterWriteSubmessage();

    unint64_t v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETSessionConnectionFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteUnderlyingError
{
}

- (BOOL)hasUnderlyingError
{
  return self->_underlyingError != 0;
}

- (void)deleteError
{
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deletePolicyId
{
}

- (BOOL)hasPolicyId
{
  return self->_policyId != 0;
}

- (void)deleteSendBufferSize
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasSendBufferSize:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSendBufferSize
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setSendBufferSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_unint64_t sendBufferSize = a3;
}

- (void)deleteIsDormant
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIsDormant:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsDormant
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsDormant:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isDormant = a3;
}

- (void)deleteIsWwanPreferred
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasIsWwanPreferred:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsWwanPreferred
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsWwanPreferred:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int isWwanPreferred = a3;
}

- (void)deleteNetworkSessionState
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasNetworkSessionState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNetworkSessionState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNetworkSessionState:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int networkSessionState = a3;
}

- (void)deleteSessionType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSessionType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSessionType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int sessionType = a3;
}

- (void)deleteConnectionMode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasConnectionMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConnectionMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int connectionMode = a3;
}

- (void)deleteConnectionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasConnectionType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnectionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConnectionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int connectionType = a3;
}

@end