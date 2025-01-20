@interface COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent
- (BOOL)hasFunctionIdentifier;
- (BOOL)hasInferenceMillis;
- (BOOL)hasInvocationIdentifier;
- (BOOL)hasPromptConstructionMillis;
- (BOOL)hasResponseProcessingMillis;
- (BOOL)hasTotalLatencyMillis;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)functionIdentifier;
- (NSString)invocationIdentifier;
- (double)inferenceMillis;
- (double)promptConstructionMillis;
- (double)responseProcessingMillis;
- (double)totalLatencyMillis;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFunctionIdentifier:(id)a3;
- (void)setHasInferenceMillis:(BOOL)a3;
- (void)setHasPromptConstructionMillis:(BOOL)a3;
- (void)setHasResponseProcessingMillis:(BOOL)a3;
- (void)setHasTotalLatencyMillis:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setInferenceMillis:(double)a3;
- (void)setInvocationIdentifier:(id)a3;
- (void)setPromptConstructionMillis:(double)a3;
- (void)setResponseProcessingMillis:(double)a3;
- (void)setTotalLatencyMillis:(double)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationIdentifier, 0);

  objc_storeStrong((id *)&self->_functionIdentifier, 0);
}

- (double)responseProcessingMillis
{
  return self->_responseProcessingMillis;
}

- (double)inferenceMillis
{
  return self->_inferenceMillis;
}

- (double)promptConstructionMillis
{
  return self->_promptConstructionMillis;
}

- (double)totalLatencyMillis
{
  return self->_totalLatencyMillis;
}

- (void)setInvocationIdentifier:(id)a3
{
}

- (NSString)invocationIdentifier
{
  return self->_invocationIdentifier;
}

- (void)setFunctionIdentifier:(id)a3
{
}

- (NSString)functionIdentifier
{
  return self->_functionIdentifier;
}

- (int64_t)version
{
  return self->_version;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
    self->_version = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  id v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent setFunctionIdentifier:](self, "setFunctionIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent setInvocationIdentifier:](self, "setInvocationIdentifier:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 8) != 0)
  {
    self->_totalLatencyMillis = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 64);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_promptConstructionMillis = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  self->_inferenceMillis = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
LABEL_11:
    self->_responseProcessingMillis = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_12:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_functionIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_invocationIdentifier hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    double totalLatencyMillis = self->_totalLatencyMillis;
    double v9 = -totalLatencyMillis;
    if (totalLatencyMillis >= 0.0) {
      double v9 = self->_totalLatencyMillis;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((has & 2) != 0)
  {
    double promptConstructionMillis = self->_promptConstructionMillis;
    double v14 = -promptConstructionMillis;
    if (promptConstructionMillis >= 0.0) {
      double v14 = self->_promptConstructionMillis;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (has)
  {
    double inferenceMillis = self->_inferenceMillis;
    double v19 = -inferenceMillis;
    if (inferenceMillis >= 0.0) {
      double v19 = self->_inferenceMillis;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  if ((has & 4) != 0)
  {
    double responseProcessingMillis = self->_responseProcessingMillis;
    double v24 = -responseProcessingMillis;
    if (responseProcessingMillis >= 0.0) {
      double v24 = self->_responseProcessingMillis;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12 ^ v17 ^ v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_version != *((void *)v4 + 5)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
LABEL_30:
    BOOL v7 = 0;
    goto LABEL_31;
  }
  functionIdentifier = self->_functionIdentifier;
  if ((unint64_t)functionIdentifier | *((void *)v4 + 6)
    && !-[NSString isEqual:](functionIdentifier, "isEqual:"))
  {
    goto LABEL_30;
  }
  invocationIdentifier = self->_invocationIdentifier;
  if ((unint64_t)invocationIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](invocationIdentifier, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_totalLatencyMillis != *((double *)v4 + 4)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_promptConstructionMillis != *((double *)v4 + 2)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_inferenceMillis != *((double *)v4 + 1)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_30;
  }
  BOOL v7 = (*((unsigned char *)v4 + 64) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_responseProcessingMillis != *((double *)v4 + 3)) {
      goto LABEL_30;
    }
    BOOL v7 = 1;
  }
LABEL_31:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_version;
    *(unsigned char *)(v5 + 64) |= 0x10u;
  }
  uint64_t v7 = [(NSString *)self->_functionIdentifier copyWithZone:a3];
  v8 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v7;

  uint64_t v9 = [(NSString *)self->_invocationIdentifier copyWithZone:a3];
  long double v10 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v9;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v6 + 32) = self->_totalLatencyMillis;
    *(unsigned char *)(v6 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(double *)(v6 + 8) = self->_inferenceMillis;
      *(unsigned char *)(v6 + 64) |= 1u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return (id)v6;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v6 + 16) = self->_promptConstructionMillis;
  *(unsigned char *)(v6 + 64) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(double *)(v6 + 24) = self->_responseProcessingMillis;
    *(unsigned char *)(v6 + 64) |= 4u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[5] = self->_version;
    *((unsigned char *)v4 + 64) |= 0x10u;
  }
  uint64_t v6 = v4;
  if (self->_functionIdentifier)
  {
    objc_msgSend(v4, "setFunctionIdentifier:");
    id v4 = v6;
  }
  if (self->_invocationIdentifier)
  {
    objc_msgSend(v6, "setInvocationIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(void *)&self->_totalLatencyMillis;
    *((unsigned char *)v4 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v4[2] = *(void *)&self->_promptConstructionMillis;
  *((unsigned char *)v4 + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  v4[1] = *(void *)&self->_inferenceMillis;
  *((unsigned char *)v4 + 64) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    v4[3] = *(void *)&self->_responseProcessingMillis;
    *((unsigned char *)v4 + 64) |= 4u;
  }
LABEL_12:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_functionIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_invocationIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_11:
  }
    PBDataWriterWriteDoubleField();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    id v4 = [NSNumber numberWithLongLong:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  functionIdentifier = self->_functionIdentifier;
  if (functionIdentifier) {
    [v3 setObject:functionIdentifier forKey:@"functionIdentifier"];
  }
  invocationIdentifier = self->_invocationIdentifier;
  if (invocationIdentifier) {
    [v3 setObject:invocationIdentifier forKey:@"invocationIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    long double v10 = [NSNumber numberWithDouble:self->_totalLatencyMillis];
    [v3 setObject:v10 forKey:@"totalLatencyMillis"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  double v11 = [NSNumber numberWithDouble:self->_promptConstructionMillis];
  [v3 setObject:v11 forKey:@"promptConstructionMillis"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  unint64_t v12 = [NSNumber numberWithDouble:self->_inferenceMillis];
  [v3 setObject:v12 forKey:@"inferenceMillis"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    v8 = [NSNumber numberWithDouble:self->_responseProcessingMillis];
    [v3 setObject:v8 forKey:@"responseProcessingMillis"];
  }
LABEL_12:

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent;
  id v4 = [(COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent *)&v8 description];
  id v5 = [(COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasResponseProcessingMillis
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasResponseProcessingMillis:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setResponseProcessingMillis:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double responseProcessingMillis = a3;
}

- (BOOL)hasInferenceMillis
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasInferenceMillis:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setInferenceMillis:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double inferenceMillis = a3;
}

- (BOOL)hasPromptConstructionMillis
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasPromptConstructionMillis:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setPromptConstructionMillis:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double promptConstructionMillis = a3;
}

- (BOOL)hasTotalLatencyMillis
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasTotalLatencyMillis:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setTotalLatencyMillis:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_double totalLatencyMillis = a3;
}

- (BOOL)hasInvocationIdentifier
{
  return self->_invocationIdentifier != 0;
}

- (BOOL)hasFunctionIdentifier
{
  return self->_functionIdentifier != 0;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_version = a3;
}

@end