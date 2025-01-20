@interface NTPBCoefficients
- (BOOL)hasArticleEmbeddingScoreCoefficient;
- (BOOL)hasAutofavoritedScoreCoefficient;
- (BOOL)hasClientScoreCoefficient;
- (BOOL)hasConversionCoefficient;
- (BOOL)hasHalfLifeCoefficient;
- (BOOL)hasServerScoreCoefficient;
- (BOOL)hasSubscribedChannelScoreCoefficent;
- (BOOL)hasSubscribedTopicScoreCoefficient;
- (BOOL)hasTabiScoreCoefficient;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)articleEmbeddingScoreCoefficient;
- (double)autofavoritedScoreCoefficient;
- (double)clientScoreCoefficient;
- (double)conversionCoefficient;
- (double)halfLifeCoefficient;
- (double)serverScoreCoefficient;
- (double)subscribedChannelScoreCoefficent;
- (double)subscribedTopicScoreCoefficient;
- (double)tabiScoreCoefficient;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleEmbeddingScoreCoefficient:(double)a3;
- (void)setAutofavoritedScoreCoefficient:(double)a3;
- (void)setClientScoreCoefficient:(double)a3;
- (void)setConversionCoefficient:(double)a3;
- (void)setHalfLifeCoefficient:(double)a3;
- (void)setHasArticleEmbeddingScoreCoefficient:(BOOL)a3;
- (void)setHasAutofavoritedScoreCoefficient:(BOOL)a3;
- (void)setHasClientScoreCoefficient:(BOOL)a3;
- (void)setHasConversionCoefficient:(BOOL)a3;
- (void)setHasHalfLifeCoefficient:(BOOL)a3;
- (void)setHasServerScoreCoefficient:(BOOL)a3;
- (void)setHasSubscribedChannelScoreCoefficent:(BOOL)a3;
- (void)setHasSubscribedTopicScoreCoefficient:(BOOL)a3;
- (void)setHasTabiScoreCoefficient:(BOOL)a3;
- (void)setServerScoreCoefficient:(double)a3;
- (void)setSubscribedChannelScoreCoefficent:(double)a3;
- (void)setSubscribedTopicScoreCoefficient:(double)a3;
- (void)setTabiScoreCoefficient:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBCoefficients

- (void)setServerScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_serverScoreCoefficient = a3;
}

- (void)setHasServerScoreCoefficient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasServerScoreCoefficient
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setClientScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clientScoreCoefficient = a3;
}

- (void)setHasClientScoreCoefficient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClientScoreCoefficient
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSubscribedTopicScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subscribedTopicScoreCoefficient = a3;
}

- (void)setHasSubscribedTopicScoreCoefficient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSubscribedTopicScoreCoefficient
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSubscribedChannelScoreCoefficent:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_subscribedChannelScoreCoefficent = a3;
}

- (void)setHasSubscribedChannelScoreCoefficent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSubscribedChannelScoreCoefficent
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAutofavoritedScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_autofavoritedScoreCoefficient = a3;
}

- (void)setHasAutofavoritedScoreCoefficient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAutofavoritedScoreCoefficient
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setArticleEmbeddingScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_articleEmbeddingScoreCoefficient = a3;
}

- (void)setHasArticleEmbeddingScoreCoefficient:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasArticleEmbeddingScoreCoefficient
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTabiScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_tabiScoreCoefficient = a3;
}

- (void)setHasTabiScoreCoefficient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTabiScoreCoefficient
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setConversionCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_conversionCoefficient = a3;
}

- (void)setHasConversionCoefficient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConversionCoefficient
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHalfLifeCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_halfLifeCoefficient = a3;
}

- (void)setHasHalfLifeCoefficient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHalfLifeCoefficient
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBCoefficients;
  v4 = [(NTPBCoefficients *)&v8 description];
  v5 = [(NTPBCoefficients *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_serverScoreCoefficient];
    [v3 setObject:v7 forKey:@"server_score_coefficient"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_clientScoreCoefficient];
  [v3 setObject:v8 forKey:@"client_score_coefficient"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = [NSNumber numberWithDouble:self->_subscribedTopicScoreCoefficient];
  [v3 setObject:v9 forKey:@"subscribed_topic_score_coefficient"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = [NSNumber numberWithDouble:self->_subscribedChannelScoreCoefficent];
  [v3 setObject:v10 forKey:@"subscribed_channel_score_coefficent"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithDouble:self->_autofavoritedScoreCoefficient];
  [v3 setObject:v11 forKey:@"autofavorited_score_coefficient"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = [NSNumber numberWithDouble:self->_articleEmbeddingScoreCoefficient];
  [v3 setObject:v12 forKey:@"article_embedding_score_coefficient"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = [NSNumber numberWithDouble:self->_tabiScoreCoefficient];
  [v3 setObject:v13 forKey:@"tabi_score_coefficient"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = [NSNumber numberWithDouble:self->_conversionCoefficient];
  [v3 setObject:v14 forKey:@"conversion_coefficient"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    v5 = [NSNumber numberWithDouble:self->_halfLifeCoefficient];
    [v3 setObject:v5 forKey:@"half_life_coefficient"];
  }
LABEL_11:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCoefficientsReadFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_10:
  }
    PBDataWriterWriteDoubleField();
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)result + 6) = *(void *)&self->_serverScoreCoefficient;
    *((_WORD *)result + 40) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 3) = *(void *)&self->_clientScoreCoefficient;
  *((_WORD *)result + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 8) = *(void *)&self->_subscribedTopicScoreCoefficient;
  *((_WORD *)result + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 7) = *(void *)&self->_subscribedChannelScoreCoefficent;
  *((_WORD *)result + 40) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 2) = *(void *)&self->_autofavoritedScoreCoefficient;
  *((_WORD *)result + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 1) = *(void *)&self->_articleEmbeddingScoreCoefficient;
  *((_WORD *)result + 40) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 9) = *(void *)&self->_tabiScoreCoefficient;
  *((_WORD *)result + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((void *)result + 4) = *(void *)&self->_conversionCoefficient;
  *((_WORD *)result + 40) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_10:
  *((void *)result + 5) = *(void *)&self->_halfLifeCoefficient;
  *((_WORD *)result + 40) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 40);
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_serverScoreCoefficient != *((double *)v4 + 6)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
LABEL_46:
    BOOL v7 = 0;
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_clientScoreCoefficient != *((double *)v4 + 3)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_subscribedTopicScoreCoefficient != *((double *)v4 + 8)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_subscribedChannelScoreCoefficent != *((double *)v4 + 7)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_autofavoritedScoreCoefficient != *((double *)v4 + 2)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_46;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_articleEmbeddingScoreCoefficient != *((double *)v4 + 1)) {
      goto LABEL_46;
    }
  }
  else if (v6)
  {
    goto LABEL_46;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_tabiScoreCoefficient != *((double *)v4 + 9)) {
      goto LABEL_46;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_conversionCoefficient != *((double *)v4 + 4)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_46;
  }
  BOOL v7 = (v6 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_halfLifeCoefficient != *((double *)v4 + 5)) {
      goto LABEL_46;
    }
    BOOL v7 = 1;
  }
LABEL_47:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    double serverScoreCoefficient = self->_serverScoreCoefficient;
    double v6 = -serverScoreCoefficient;
    if (serverScoreCoefficient >= 0.0) {
      double v6 = self->_serverScoreCoefficient;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 4) != 0)
  {
    double clientScoreCoefficient = self->_clientScoreCoefficient;
    double v11 = -clientScoreCoefficient;
    if (clientScoreCoefficient >= 0.0) {
      double v11 = self->_clientScoreCoefficient;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x80) != 0)
  {
    double subscribedTopicScoreCoefficient = self->_subscribedTopicScoreCoefficient;
    double v16 = -subscribedTopicScoreCoefficient;
    if (subscribedTopicScoreCoefficient >= 0.0) {
      double v16 = self->_subscribedTopicScoreCoefficient;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 0x40) != 0)
  {
    double subscribedChannelScoreCoefficent = self->_subscribedChannelScoreCoefficent;
    double v21 = -subscribedChannelScoreCoefficent;
    if (subscribedChannelScoreCoefficent >= 0.0) {
      double v21 = self->_subscribedChannelScoreCoefficent;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 2) != 0)
  {
    double autofavoritedScoreCoefficient = self->_autofavoritedScoreCoefficient;
    double v26 = -autofavoritedScoreCoefficient;
    if (autofavoritedScoreCoefficient >= 0.0) {
      double v26 = self->_autofavoritedScoreCoefficient;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if (has)
  {
    double articleEmbeddingScoreCoefficient = self->_articleEmbeddingScoreCoefficient;
    double v31 = -articleEmbeddingScoreCoefficient;
    if (articleEmbeddingScoreCoefficient >= 0.0) {
      double v31 = self->_articleEmbeddingScoreCoefficient;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  unint64_t v52 = v24;
  unint64_t v34 = v14;
  if ((has & 0x100) != 0)
  {
    double tabiScoreCoefficient = self->_tabiScoreCoefficient;
    double v38 = -tabiScoreCoefficient;
    if (tabiScoreCoefficient >= 0.0) {
      double v38 = self->_tabiScoreCoefficient;
    }
    long double v39 = floor(v38 + 0.5);
    double v40 = (v38 - v39) * 1.84467441e19;
    unint64_t v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    unint64_t v35 = v9;
    if (v40 >= 0.0)
    {
      if (v40 > 0.0) {
        v36 += (unint64_t)v40;
      }
    }
    else
    {
      v36 -= (unint64_t)fabs(v40);
    }
  }
  else
  {
    unint64_t v35 = v9;
    unint64_t v36 = 0;
  }
  if ((has & 8) != 0)
  {
    double conversionCoefficient = self->_conversionCoefficient;
    double v43 = -conversionCoefficient;
    if (conversionCoefficient >= 0.0) {
      double v43 = self->_conversionCoefficient;
    }
    long double v44 = floor(v43 + 0.5);
    double v45 = (v43 - v44) * 1.84467441e19;
    unint64_t v41 = 2654435761u * (unint64_t)fmod(v44, 1.84467441e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0) {
        v41 += (unint64_t)v45;
      }
    }
    else
    {
      v41 -= (unint64_t)fabs(v45);
    }
  }
  else
  {
    unint64_t v41 = 0;
  }
  if ((has & 0x10) != 0)
  {
    double halfLifeCoefficient = self->_halfLifeCoefficient;
    double v48 = -halfLifeCoefficient;
    if (halfLifeCoefficient >= 0.0) {
      double v48 = self->_halfLifeCoefficient;
    }
    long double v49 = floor(v48 + 0.5);
    double v50 = (v48 - v49) * 1.84467441e19;
    unint64_t v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0) {
        v46 += (unint64_t)v50;
      }
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    unint64_t v46 = 0;
  }
  return v35 ^ v4 ^ v34 ^ v19 ^ v52 ^ v29 ^ v36 ^ v41 ^ v46;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x20) != 0)
  {
    self->_double serverScoreCoefficient = *((double *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v5 = *((_WORD *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double clientScoreCoefficient = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_double subscribedTopicScoreCoefficient = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_double subscribedChannelScoreCoefficent = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_double autofavoritedScoreCoefficient = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_double articleEmbeddingScoreCoefficient = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_double tabiScoreCoefficient = *((double *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_double conversionCoefficient = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 40) & 0x10) != 0)
  {
LABEL_10:
    self->_double halfLifeCoefficient = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_11:
}

- (double)serverScoreCoefficient
{
  return self->_serverScoreCoefficient;
}

- (double)clientScoreCoefficient
{
  return self->_clientScoreCoefficient;
}

- (double)subscribedTopicScoreCoefficient
{
  return self->_subscribedTopicScoreCoefficient;
}

- (double)subscribedChannelScoreCoefficent
{
  return self->_subscribedChannelScoreCoefficent;
}

- (double)autofavoritedScoreCoefficient
{
  return self->_autofavoritedScoreCoefficient;
}

- (double)articleEmbeddingScoreCoefficient
{
  return self->_articleEmbeddingScoreCoefficient;
}

- (double)tabiScoreCoefficient
{
  return self->_tabiScoreCoefficient;
}

- (double)conversionCoefficient
{
  return self->_conversionCoefficient;
}

- (double)halfLifeCoefficient
{
  return self->_halfLifeCoefficient;
}

@end