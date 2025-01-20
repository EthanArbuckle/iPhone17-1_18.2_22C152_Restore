@interface MHSchemaMHUserEngagementAggregatedStats
- (BOOL)hasIntendedRequestCount;
- (BOOL)hasIntendedRequestRatio;
- (BOOL)hasMitigationType;
- (BOOL)hasModelVersion;
- (BOOL)hasRequestCount;
- (BOOL)hasTriggeredMechanismRequestRatio;
- (BOOL)hasUnintendedRequestCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHUserEngagementAggregatedStats)initWithDictionary:(id)a3;
- (MHSchemaMHUserEngagementAggregatedStats)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)modelVersion;
- (double)intendedRequestRatio;
- (double)triggeredMechanismRequestRatio;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)intendedRequestCount;
- (int)mitigationType;
- (int)requestCount;
- (int)unintendedRequestCount;
- (unint64_t)hash;
- (void)deleteIntendedRequestCount;
- (void)deleteIntendedRequestRatio;
- (void)deleteMitigationType;
- (void)deleteModelVersion;
- (void)deleteRequestCount;
- (void)deleteTriggeredMechanismRequestRatio;
- (void)deleteUnintendedRequestCount;
- (void)setHasIntendedRequestCount:(BOOL)a3;
- (void)setHasIntendedRequestRatio:(BOOL)a3;
- (void)setHasMitigationType:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasRequestCount:(BOOL)a3;
- (void)setHasTriggeredMechanismRequestRatio:(BOOL)a3;
- (void)setHasUnintendedRequestCount:(BOOL)a3;
- (void)setIntendedRequestCount:(int)a3;
- (void)setIntendedRequestRatio:(double)a3;
- (void)setMitigationType:(int)a3;
- (void)setModelVersion:(id)a3;
- (void)setRequestCount:(int)a3;
- (void)setTriggeredMechanismRequestRatio:(double)a3;
- (void)setUnintendedRequestCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHUserEngagementAggregatedStats

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (double)triggeredMechanismRequestRatio
{
  return self->_triggeredMechanismRequestRatio;
}

- (double)intendedRequestRatio
{
  return self->_intendedRequestRatio;
}

- (int)unintendedRequestCount
{
  return self->_unintendedRequestCount;
}

- (int)intendedRequestCount
{
  return self->_intendedRequestCount;
}

- (int)requestCount
{
  return self->_requestCount;
}

- (int)mitigationType
{
  return self->_mitigationType;
}

- (MHSchemaMHUserEngagementAggregatedStats)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MHSchemaMHUserEngagementAggregatedStats;
  v5 = [(MHSchemaMHUserEngagementAggregatedStats *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mitigationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHUserEngagementAggregatedStats setMitigationType:](v5, "setMitigationType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"requestCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHUserEngagementAggregatedStats setRequestCount:](v5, "setRequestCount:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"intendedRequestCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHUserEngagementAggregatedStats setIntendedRequestCount:](v5, "setIntendedRequestCount:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"unintendedRequestCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHUserEngagementAggregatedStats setUnintendedRequestCount:](v5, "setUnintendedRequestCount:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"intendedRequestRatio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[MHSchemaMHUserEngagementAggregatedStats setIntendedRequestRatio:](v5, "setIntendedRequestRatio:");
    }
    v11 = [v4 objectForKeyedSubscript:@"triggeredMechanismRequestRatio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
      -[MHSchemaMHUserEngagementAggregatedStats setTriggeredMechanismRequestRatio:](v5, "setTriggeredMechanismRequestRatio:");
    }
    v12 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(MHSchemaMHUserEngagementAggregatedStats *)v5 setModelVersion:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (MHSchemaMHUserEngagementAggregatedStats)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHUserEngagementAggregatedStats *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHUserEngagementAggregatedStats *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[MHSchemaMHUserEngagementAggregatedStats intendedRequestCount](self, "intendedRequestCount"));
    [v3 setObject:v5 forKeyedSubscript:@"intendedRequestCount"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v6 = NSNumber;
  [(MHSchemaMHUserEngagementAggregatedStats *)self intendedRequestRatio];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:@"intendedRequestRatio"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  unsigned int v8 = [(MHSchemaMHUserEngagementAggregatedStats *)self mitigationType] - 1;
  if (v8 > 2) {
    v9 = @"MHUSERENGAGEMENTMODELTRIGGERMECHANISM_UNKNOWN";
  }
  else {
    v9 = off_1E5EBB550[v8];
  }
  [v3 setObject:v9 forKeyedSubscript:@"mitigationType"];
LABEL_11:
  if (self->_modelVersion)
  {
    v10 = [(MHSchemaMHUserEngagementAggregatedStats *)self modelVersion];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"modelVersion"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithInt:", -[MHSchemaMHUserEngagementAggregatedStats requestCount](self, "requestCount"));
    [v3 setObject:v15 forKeyedSubscript:@"requestCount"];

    char v12 = (char)self->_has;
    if ((v12 & 0x20) == 0)
    {
LABEL_15:
      if ((v12 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  objc_super v16 = NSNumber;
  [(MHSchemaMHUserEngagementAggregatedStats *)self triggeredMechanismRequestRatio];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  [v3 setObject:v17 forKeyedSubscript:@"triggeredMechanismRequestRatio"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_16:
    v13 = objc_msgSend(NSNumber, "numberWithInt:", -[MHSchemaMHUserEngagementAggregatedStats unintendedRequestCount](self, "unintendedRequestCount"));
    [v3 setObject:v13 forKeyedSubscript:@"unintendedRequestCount"];
  }
LABEL_17:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_mitigationType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_requestCount;
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
    uint64_t v6 = 2654435761 * self->_intendedRequestCount;
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
  uint64_t v7 = 2654435761 * self->_unintendedRequestCount;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_6:
  double intendedRequestRatio = self->_intendedRequestRatio;
  double v9 = -intendedRequestRatio;
  if (intendedRequestRatio >= 0.0) {
    double v9 = self->_intendedRequestRatio;
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
    double triggeredMechanismRequestRatio = self->_triggeredMechanismRequestRatio;
    double v15 = -triggeredMechanismRequestRatio;
    if (triggeredMechanismRequestRatio >= 0.0) {
      double v15 = self->_triggeredMechanismRequestRatio;
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
  return v5 ^ v4 ^ v6 ^ v7 ^ v12 ^ v13 ^ [(NSString *)self->_modelVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  $0333B86DA4EDEC2D89C45A58BA01F1FA has = self->_has;
  unsigned int v6 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&has)
  {
    int mitigationType = self->_mitigationType;
    if (mitigationType != [v4 mitigationType]) {
      goto LABEL_30;
    }
    $0333B86DA4EDEC2D89C45A58BA01F1FA has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int requestCount = self->_requestCount;
      if (requestCount != [v4 requestCount]) {
        goto LABEL_30;
      }
      $0333B86DA4EDEC2D89C45A58BA01F1FA has = self->_has;
      unsigned int v6 = v4[48];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int intendedRequestCount = self->_intendedRequestCount;
        if (intendedRequestCount != [v4 intendedRequestCount]) {
          goto LABEL_30;
        }
        $0333B86DA4EDEC2D89C45A58BA01F1FA has = self->_has;
        unsigned int v6 = v4[48];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          unint intendedRequestCount = self->_unintendedRequestCount;
          if (unintendedRequestCount != [v4 unintendedRequestCount]) {
            goto LABEL_30;
          }
          $0333B86DA4EDEC2D89C45A58BA01F1FA has = self->_has;
          unsigned int v6 = v4[48];
        }
        int v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            double intendedRequestRatio = self->_intendedRequestRatio;
            [v4 intendedRequestRatio];
            if (intendedRequestRatio != v16) {
              goto LABEL_30;
            }
            $0333B86DA4EDEC2D89C45A58BA01F1FA has = self->_has;
            unsigned int v6 = v4[48];
          }
          int v17 = (*(unsigned int *)&has >> 5) & 1;
          if (v17 == ((v6 >> 5) & 1))
          {
            if (!v17
              || (double triggeredMechanismRequestRatio = self->_triggeredMechanismRequestRatio,
                  [v4 triggeredMechanismRequestRatio],
                  triggeredMechanismRequestRatio == v19))
            {
              v20 = [(MHSchemaMHUserEngagementAggregatedStats *)self modelVersion];
              v21 = [v4 modelVersion];
              v22 = v21;
              if ((v20 == 0) != (v21 != 0))
              {
                uint64_t v23 = [(MHSchemaMHUserEngagementAggregatedStats *)self modelVersion];
                if (!v23)
                {

LABEL_33:
                  BOOL v28 = 1;
                  goto LABEL_31;
                }
                v24 = (void *)v23;
                v25 = [(MHSchemaMHUserEngagementAggregatedStats *)self modelVersion];
                v26 = [v4 modelVersion];
                char v27 = [v25 isEqual:v26];

                if (v27) {
                  goto LABEL_33;
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
LABEL_30:
  BOOL v28 = 0;
LABEL_31:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
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
      goto LABEL_15;
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
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
  uint64_t v5 = [(MHSchemaMHUserEngagementAggregatedStats *)self modelVersion];

  unsigned int v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    unsigned int v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHUserEngagementAggregatedStatsReadFrom(self, (uint64_t)a3);
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteTriggeredMechanismRequestRatio
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasTriggeredMechanismRequestRatio:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTriggeredMechanismRequestRatio
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTriggeredMechanismRequestRatio:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_double triggeredMechanismRequestRatio = a3;
}

- (void)deleteIntendedRequestRatio
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasIntendedRequestRatio:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIntendedRequestRatio
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIntendedRequestRatio:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_double intendedRequestRatio = a3;
}

- (void)deleteUnintendedRequestCount
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasUnintendedRequestCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUnintendedRequestCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setUnintendedRequestCount:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint intendedRequestCount = a3;
}

- (void)deleteIntendedRequestCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIntendedRequestCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntendedRequestCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIntendedRequestCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int intendedRequestCount = a3;
}

- (void)deleteRequestCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRequestCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int requestCount = a3;
}

- (void)deleteMitigationType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMitigationType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMitigationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMitigationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int mitigationType = a3;
}

@end