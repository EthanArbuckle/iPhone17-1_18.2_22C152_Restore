@interface LCServiceLoggingParameters
- (BOOL)hasEntropy;
- (BOOL)hasMessageSizeQuotaInBytes;
- (BOOL)hasOptOutOfCompression;
- (BOOL)hasOverrideIntoSamplePopulation;
- (BOOL)hasQos;
- (BOOL)hasRealtimeSamplingRate;
- (BOOL)hasTotalDiskSizeQuotaInBytes;
- (BOOL)hasUploadEndpointURL;
- (BOOL)hasUploadSamplingRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)optOutOfCompression;
- (BOOL)overrideIntoSamplePopulation;
- (BOOL)readFrom:(id)a3;
- (LCServiceLoggingParameters)initWithDictionary:(id)a3;
- (LCServiceLoggingParameters)initWithJSON:(id)a3;
- (NSData)entropy;
- (NSData)jsonData;
- (NSString)uploadEndpointURL;
- (float)realtimeSamplingRate;
- (float)uploadSamplingRate;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)messageSizeQuotaInBytes;
- (int)qos;
- (int)totalDiskSizeQuotaInBytes;
- (unint64_t)hash;
- (void)deleteEntropy;
- (void)deleteMessageSizeQuotaInBytes;
- (void)deleteOptOutOfCompression;
- (void)deleteOverrideIntoSamplePopulation;
- (void)deleteQos;
- (void)deleteRealtimeSamplingRate;
- (void)deleteTotalDiskSizeQuotaInBytes;
- (void)deleteUploadEndpointURL;
- (void)deleteUploadSamplingRate;
- (void)setEntropy:(id)a3;
- (void)setHasEntropy:(BOOL)a3;
- (void)setHasMessageSizeQuotaInBytes:(BOOL)a3;
- (void)setHasOptOutOfCompression:(BOOL)a3;
- (void)setHasOverrideIntoSamplePopulation:(BOOL)a3;
- (void)setHasQos:(BOOL)a3;
- (void)setHasRealtimeSamplingRate:(BOOL)a3;
- (void)setHasTotalDiskSizeQuotaInBytes:(BOOL)a3;
- (void)setHasUploadEndpointURL:(BOOL)a3;
- (void)setHasUploadSamplingRate:(BOOL)a3;
- (void)setMessageSizeQuotaInBytes:(int)a3;
- (void)setOptOutOfCompression:(BOOL)a3;
- (void)setOverrideIntoSamplePopulation:(BOOL)a3;
- (void)setQos:(int)a3;
- (void)setRealtimeSamplingRate:(float)a3;
- (void)setTotalDiskSizeQuotaInBytes:(int)a3;
- (void)setUploadEndpointURL:(id)a3;
- (void)setUploadSamplingRate:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation LCServiceLoggingParameters

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadEndpointURL, 0);
  objc_storeStrong((id *)&self->_entropy, 0);
}

- (void)setHasUploadEndpointURL:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasEntropy:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setUploadEndpointURL:(id)a3
{
}

- (NSString)uploadEndpointURL
{
  return self->_uploadEndpointURL;
}

- (BOOL)overrideIntoSamplePopulation
{
  return self->_overrideIntoSamplePopulation;
}

- (void)setEntropy:(id)a3
{
}

- (NSData)entropy
{
  return self->_entropy;
}

- (float)realtimeSamplingRate
{
  return self->_realtimeSamplingRate;
}

- (float)uploadSamplingRate
{
  return self->_uploadSamplingRate;
}

- (BOOL)optOutOfCompression
{
  return self->_optOutOfCompression;
}

- (int)totalDiskSizeQuotaInBytes
{
  return self->_totalDiskSizeQuotaInBytes;
}

- (int)messageSizeQuotaInBytes
{
  return self->_messageSizeQuotaInBytes;
}

- (int)qos
{
  return self->_qos;
}

- (LCServiceLoggingParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LCServiceLoggingParameters;
  v5 = [(LCServiceLoggingParameters *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"qos"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LCServiceLoggingParameters setQos:](v5, "setQos:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"messageSizeQuotaInBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LCServiceLoggingParameters setMessageSizeQuotaInBytes:](v5, "setMessageSizeQuotaInBytes:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"totalDiskSizeQuotaInBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LCServiceLoggingParameters setTotalDiskSizeQuotaInBytes:](v5, "setTotalDiskSizeQuotaInBytes:", [v8 intValue]);
    }
    v19 = v8;
    v9 = [v4 objectForKeyedSubscript:@"optOutOfCompression"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LCServiceLoggingParameters setOptOutOfCompression:](v5, "setOptOutOfCompression:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"uploadSamplingRate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[LCServiceLoggingParameters setUploadSamplingRate:](v5, "setUploadSamplingRate:");
    }
    v11 = [v4 objectForKeyedSubscript:@"realtimeSamplingRate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[LCServiceLoggingParameters setRealtimeSamplingRate:](v5, "setRealtimeSamplingRate:");
    }
    v20 = v6;
    v12 = [v4 objectForKeyedSubscript:@"entropy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
      [(LCServiceLoggingParameters *)v5 setEntropy:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"overrideIntoSamplePopulation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LCServiceLoggingParameters setOverrideIntoSamplePopulation:](v5, "setOverrideIntoSamplePopulation:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"uploadEndpointURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(LCServiceLoggingParameters *)v5 setUploadEndpointURL:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (LCServiceLoggingParameters)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LCServiceLoggingParameters *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LCServiceLoggingParameters *)self dictionaryRepresentation];
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
  if (self->_entropy)
  {
    id v4 = [(LCServiceLoggingParameters *)self entropy];
    v5 = [v4 base64EncodedStringWithOptions:0];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"entropy"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"entropy"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = objc_msgSend(NSNumber, "numberWithInt:", -[LCServiceLoggingParameters messageSizeQuotaInBytes](self, "messageSizeQuotaInBytes"));
    [v3 setObject:v14 forKeyedSubscript:@"messageSizeQuotaInBytes"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_8:
      if ((has & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_8;
  }
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[LCServiceLoggingParameters optOutOfCompression](self, "optOutOfCompression"));
  [v3 setObject:v15 forKeyedSubscript:@"optOutOfCompression"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[LCServiceLoggingParameters overrideIntoSamplePopulation](self, "overrideIntoSamplePopulation"));
  [v3 setObject:v16 forKeyedSubscript:@"overrideIntoSamplePopulation"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_23:
  int v17 = [(LCServiceLoggingParameters *)self qos];
  v18 = @"QOSClassLow";
  if (v17 == 1) {
    v18 = @"QOSClassMedium";
  }
  if (v17 == 2) {
    v19 = @"QOSClassHigh";
  }
  else {
    v19 = v18;
  }
  [v3 setObject:v19 forKeyedSubscript:@"qos"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_29:
  v20 = NSNumber;
  [(LCServiceLoggingParameters *)self realtimeSamplingRate];
  objc_super v21 = objc_msgSend(v20, "numberWithFloat:");
  [v3 setObject:v21 forKeyedSubscript:@"realtimeSamplingRate"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_12:
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[LCServiceLoggingParameters totalDiskSizeQuotaInBytes](self, "totalDiskSizeQuotaInBytes"));
    [v3 setObject:v8 forKeyedSubscript:@"totalDiskSizeQuotaInBytes"];
  }
LABEL_13:
  if (self->_uploadEndpointURL)
  {
    v9 = [(LCServiceLoggingParameters *)self uploadEndpointURL];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"uploadEndpointURL"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v11 = NSNumber;
    [(LCServiceLoggingParameters *)self uploadSamplingRate];
    v12 = objc_msgSend(v11, "numberWithFloat:");
    [v3 setObject:v12 forKeyedSubscript:@"uploadSamplingRate"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_qos;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_messageSizeQuotaInBytes;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_totalDiskSizeQuotaInBytes;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_13:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_14:
    unint64_t v12 = 0;
    goto LABEL_17;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_optOutOfCompression;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_6:
  float uploadSamplingRate = self->_uploadSamplingRate;
  double v9 = uploadSamplingRate;
  if (uploadSamplingRate < 0.0) {
    double v9 = -uploadSamplingRate;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_17:
  if ((has & 0x20) != 0)
  {
    float realtimeSamplingRate = self->_realtimeSamplingRate;
    double v15 = realtimeSamplingRate;
    if (realtimeSamplingRate < 0.0) {
      double v15 = -realtimeSamplingRate;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  uint64_t v18 = [(NSData *)self->_entropy hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v19 = 2654435761 * self->_overrideIntoSamplePopulation;
  }
  else {
    uint64_t v19 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v12 ^ v13 ^ v19 ^ v18 ^ [(NSString *)self->_uploadEndpointURL hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  $0322636175C7CAAEAB91C861E7CD74CB has = self->_has;
  unsigned int v6 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_38;
  }
  if (*(unsigned char *)&has)
  {
    int qos = self->_qos;
    if (qos != [v4 qos]) {
      goto LABEL_38;
    }
    $0322636175C7CAAEAB91C861E7CD74CB has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int messageSizeQuotaInBytes = self->_messageSizeQuotaInBytes;
      if (messageSizeQuotaInBytes != [v4 messageSizeQuotaInBytes]) {
        goto LABEL_38;
      }
      $0322636175C7CAAEAB91C861E7CD74CB has = self->_has;
      unsigned int v6 = v4[56];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int totalDiskSizeQuotaInBytes = self->_totalDiskSizeQuotaInBytes;
        if (totalDiskSizeQuotaInBytes != [v4 totalDiskSizeQuotaInBytes]) {
          goto LABEL_38;
        }
        $0322636175C7CAAEAB91C861E7CD74CB has = self->_has;
        unsigned int v6 = v4[56];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          int optOutOfCompression = self->_optOutOfCompression;
          if (optOutOfCompression != [v4 optOutOfCompression]) {
            goto LABEL_38;
          }
          $0322636175C7CAAEAB91C861E7CD74CB has = self->_has;
          unsigned int v6 = v4[56];
        }
        int v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            float uploadSamplingRate = self->_uploadSamplingRate;
            [v4 uploadSamplingRate];
            if (uploadSamplingRate != v16) {
              goto LABEL_38;
            }
            $0322636175C7CAAEAB91C861E7CD74CB has = self->_has;
            unsigned int v6 = v4[56];
          }
          int v17 = (*(unsigned int *)&has >> 5) & 1;
          if (v17 != ((v6 >> 5) & 1)) {
            goto LABEL_38;
          }
          if (v17)
          {
            float realtimeSamplingRate = self->_realtimeSamplingRate;
            [v4 realtimeSamplingRate];
            if (realtimeSamplingRate != v19) {
              goto LABEL_38;
            }
          }
          v20 = [(LCServiceLoggingParameters *)self entropy];
          objc_super v21 = [v4 entropy];
          if ((v20 == 0) == (v21 != 0)) {
            goto LABEL_37;
          }
          uint64_t v22 = [(LCServiceLoggingParameters *)self entropy];
          if (v22)
          {
            v23 = (void *)v22;
            v24 = [(LCServiceLoggingParameters *)self entropy];
            v25 = [v4 entropy];
            int v26 = [v24 isEqual:v25];

            if (!v26) {
              goto LABEL_38;
            }
          }
          else
          {
          }
          int v27 = (*(unsigned char *)&self->_has >> 6) & 1;
          if (v27 != ((v4[56] >> 6) & 1)) {
            goto LABEL_38;
          }
          if (v27)
          {
            int overrideIntoSamplePopulation = self->_overrideIntoSamplePopulation;
            if (overrideIntoSamplePopulation != [v4 overrideIntoSamplePopulation]) {
              goto LABEL_38;
            }
          }
          v20 = [(LCServiceLoggingParameters *)self uploadEndpointURL];
          objc_super v21 = [v4 uploadEndpointURL];
          if ((v20 == 0) != (v21 != 0))
          {
            uint64_t v29 = [(LCServiceLoggingParameters *)self uploadEndpointURL];
            if (!v29)
            {

LABEL_41:
              BOOL v34 = 1;
              goto LABEL_39;
            }
            v30 = (void *)v29;
            v31 = [(LCServiceLoggingParameters *)self uploadEndpointURL];
            v32 = [v4 uploadEndpointURL];
            char v33 = [v31 isEqual:v32];

            if (v33) {
              goto LABEL_41;
            }
          }
          else
          {
LABEL_37:
          }
        }
      }
    }
  }
LABEL_38:
  BOOL v34 = 0;
LABEL_39:

  return v34;
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
      goto LABEL_19;
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
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteFloatField();
LABEL_8:
  uint64_t v5 = [(LCServiceLoggingParameters *)self entropy];

  if (v5) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  unsigned int v6 = [(LCServiceLoggingParameters *)self uploadEndpointURL];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return LCServiceLoggingParametersReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteUploadEndpointURL
{
}

- (BOOL)hasUploadEndpointURL
{
  return self->_uploadEndpointURL != 0;
}

- (void)deleteOverrideIntoSamplePopulation
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasOverrideIntoSamplePopulation:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasOverrideIntoSamplePopulation
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setOverrideIntoSamplePopulation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int overrideIntoSamplePopulation = a3;
}

- (void)deleteEntropy
{
}

- (BOOL)hasEntropy
{
  return self->_entropy != 0;
}

- (void)deleteRealtimeSamplingRate
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasRealtimeSamplingRate:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRealtimeSamplingRate
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRealtimeSamplingRate:(float)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_float realtimeSamplingRate = a3;
}

- (void)deleteUploadSamplingRate
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasUploadSamplingRate:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUploadSamplingRate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setUploadSamplingRate:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_float uploadSamplingRate = a3;
}

- (void)deleteOptOutOfCompression
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasOptOutOfCompression:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOptOutOfCompression
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setOptOutOfCompression:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int optOutOfCompression = a3;
}

- (void)deleteTotalDiskSizeQuotaInBytes
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasTotalDiskSizeQuotaInBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalDiskSizeQuotaInBytes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTotalDiskSizeQuotaInBytes:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int totalDiskSizeQuotaInBytes = a3;
}

- (void)deleteMessageSizeQuotaInBytes
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMessageSizeQuotaInBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageSizeQuotaInBytes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMessageSizeQuotaInBytes:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int messageSizeQuotaInBytes = a3;
}

- (void)deleteQos
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasQos:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasQos
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setQos:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int qos = a3;
}

@end