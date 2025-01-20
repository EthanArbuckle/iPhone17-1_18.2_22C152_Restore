@interface NTPBTagMetadata
- (BOOL)hasContentAndRelevanceInfo;
- (BOOL)hasFlowRate;
- (BOOL)hasOntologyLevel;
- (BOOL)hasQuality;
- (BOOL)hasSubscriptionRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NTPBContentAndRelevanceInfo)contentAndRelevanceInfo;
- (float)flowRate;
- (float)quality;
- (float)subscriptionRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ontologyLevel;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setContentAndRelevanceInfo:(id)a3;
- (void)setFlowRate:(float)a3;
- (void)setHasFlowRate:(BOOL)a3;
- (void)setHasOntologyLevel:(BOOL)a3;
- (void)setHasQuality:(BOOL)a3;
- (void)setHasSubscriptionRate:(BOOL)a3;
- (void)setOntologyLevel:(int)a3;
- (void)setQuality:(float)a3;
- (void)setSubscriptionRate:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTagMetadata

- (void)setFlowRate:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_flowRate = a3;
}

- (void)setHasFlowRate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFlowRate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSubscriptionRate:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_subscriptionRate = a3;
}

- (void)setHasSubscriptionRate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSubscriptionRate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setQuality:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_quality = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasQuality
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setOntologyLevel:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ontologyLevel = a3;
}

- (void)setHasOntologyLevel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOntologyLevel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasContentAndRelevanceInfo
{
  return self->_contentAndRelevanceInfo != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTagMetadata;
  v4 = [(NTPBTagMetadata *)&v8 description];
  v5 = [(NTPBTagMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    *(float *)&double v4 = self->_flowRate;
    v10 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v10 forKey:@"flow_rate"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_subscriptionRate;
  v11 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v11 forKey:@"subscription_rate"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *(float *)&double v4 = self->_quality;
  v12 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v12 forKey:@"quality"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v6 = [NSNumber numberWithInt:self->_ontologyLevel];
    [v3 setObject:v6 forKey:@"ontology_level"];
  }
LABEL_6:
  contentAndRelevanceInfo = self->_contentAndRelevanceInfo;
  if (contentAndRelevanceInfo)
  {
    objc_super v8 = [(NTPBContentAndRelevanceInfo *)contentAndRelevanceInfo dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"content_and_relevance_info"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTagMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_6:
  if (self->_contentAndRelevanceInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(float *)(v5 + 16) = self->_flowRate;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(float *)(v5 + 24) = self->_quality;
      *(unsigned char *)(v5 + 32) |= 4u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 28) = self->_subscriptionRate;
  *(unsigned char *)(v5 + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 20) = self->_ontologyLevel;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
LABEL_6:
  id v8 = [(NTPBContentAndRelevanceInfo *)self->_contentAndRelevanceInfo copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_flowRate != *((float *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_24:
    char v6 = 0;
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_subscriptionRate != *((float *)v4 + 7)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_quality != *((float *)v4 + 6)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_ontologyLevel != *((_DWORD *)v4 + 5)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_24;
  }
  contentAndRelevanceInfo = self->_contentAndRelevanceInfo;
  if ((unint64_t)contentAndRelevanceInfo | *((void *)v4 + 1)) {
    char v6 = -[NTPBContentAndRelevanceInfo isEqual:](contentAndRelevanceInfo, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float flowRate = self->_flowRate;
    float v6 = -flowRate;
    if (flowRate >= 0.0) {
      float v6 = self->_flowRate;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 8) != 0)
  {
    float subscriptionRate = self->_subscriptionRate;
    float v11 = -subscriptionRate;
    if (subscriptionRate >= 0.0) {
      float v11 = self->_subscriptionRate;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 4) != 0)
  {
    float quality = self->_quality;
    float v16 = -quality;
    if (quality >= 0.0) {
      float v16 = self->_quality;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v19 = 2654435761 * self->_ontologyLevel;
  }
  else {
    uint64_t v19 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ [(NTPBContentAndRelevanceInfo *)self->_contentAndRelevanceInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 32);
  if (v6)
  {
    self->_float flowRate = *((float *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 32);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_float subscriptionRate = *((float *)v4 + 7);
  *(unsigned char *)&self->_has |= 8u;
  char v6 = *((unsigned char *)v4 + 32);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_float quality = *((float *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_5:
    self->_ontologyLevel = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
  contentAndRelevanceInfo = self->_contentAndRelevanceInfo;
  uint64_t v8 = v5[1];
  if (contentAndRelevanceInfo)
  {
    if (v8) {
      -[NTPBContentAndRelevanceInfo mergeFrom:](contentAndRelevanceInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBTagMetadata setContentAndRelevanceInfo:](self, "setContentAndRelevanceInfo:");
  }

  MEMORY[0x270F9A758]();
}

- (float)flowRate
{
  return self->_flowRate;
}

- (float)subscriptionRate
{
  return self->_subscriptionRate;
}

- (float)quality
{
  return self->_quality;
}

- (int)ontologyLevel
{
  return self->_ontologyLevel;
}

- (NTPBContentAndRelevanceInfo)contentAndRelevanceInfo
{
  return self->_contentAndRelevanceInfo;
}

- (void)setContentAndRelevanceInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end