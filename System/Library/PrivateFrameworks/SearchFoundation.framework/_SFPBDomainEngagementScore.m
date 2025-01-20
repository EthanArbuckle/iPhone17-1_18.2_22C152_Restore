@interface _SFPBDomainEngagementScore
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBDomainEngagementScore)initWithDictionary:(id)a3;
- (_SFPBDomainEngagementScore)initWithFacade:(id)a3;
- (_SFPBDomainEngagementScore)initWithJSON:(id)a3;
- (float)iFunScore;
- (float)score;
- (id)dictionaryRepresentation;
- (int)domain;
- (int)scoreConfidence;
- (unint64_t)hash;
- (void)setDomain:(int)a3;
- (void)setIFunScore:(float)a3;
- (void)setScore:(float)a3;
- (void)setScoreConfidence:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBDomainEngagementScore

- (_SFPBDomainEngagementScore)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBDomainEngagementScore *)self init];
  if (v5)
  {
    if ([v4 hasDomain]) {
      -[_SFPBDomainEngagementScore setDomain:](v5, "setDomain:", [v4 domain]);
    }
    v6 = [v4 scoreConfidence];

    if (v6)
    {
      v7 = [v4 scoreConfidence];
      -[_SFPBDomainEngagementScore setScoreConfidence:](v5, "setScoreConfidence:", [v7 intValue]);
    }
    v8 = [v4 score];

    if (v8)
    {
      v9 = [v4 score];
      [v9 floatValue];
      -[_SFPBDomainEngagementScore setScore:](v5, "setScore:");
    }
    v10 = [v4 iFunScore];

    if (v10)
    {
      v11 = [v4 iFunScore];
      [v11 floatValue];
      -[_SFPBDomainEngagementScore setIFunScore:](v5, "setIFunScore:");
    }
    v12 = v5;
  }

  return v5;
}

- (float)iFunScore
{
  return self->_iFunScore;
}

- (float)score
{
  return self->_score;
}

- (int)scoreConfidence
{
  return self->_scoreConfidence;
}

- (int)domain
{
  return self->_domain;
}

- (_SFPBDomainEngagementScore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBDomainEngagementScore;
  v5 = [(_SFPBDomainEngagementScore *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"domain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDomainEngagementScore setDomain:](v5, "setDomain:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"scoreConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDomainEngagementScore setScoreConfidence:](v5, "setScoreConfidence:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[_SFPBDomainEngagementScore setScore:](v5, "setScore:");
    }
    v9 = [v4 objectForKeyedSubscript:@"iFunScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[_SFPBDomainEngagementScore setIFunScore:](v5, "setIFunScore:");
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBDomainEngagementScore)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBDomainEngagementScore *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBDomainEngagementScore *)self dictionaryRepresentation];
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
  if (self->_domain)
  {
    uint64_t v4 = [(_SFPBDomainEngagementScore *)self domain];
    if (v4 >= 0x58)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2E8B0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"domain"];
  }
  if (self->_iFunScore != 0.0)
  {
    v6 = NSNumber;
    [(_SFPBDomainEngagementScore *)self iFunScore];
    uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"iFunScore"];
  }
  if (self->_score != 0.0)
  {
    v8 = NSNumber;
    [(_SFPBDomainEngagementScore *)self score];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"score"];
  }
  if (self->_scoreConfidence)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBDomainEngagementScore scoreConfidence](self, "scoreConfidence"));
    [v3 setObject:v10 forKeyedSubscript:@"scoreConfidence"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t domain = self->_domain;
  uint64_t scoreConfidence = self->_scoreConfidence;
  float score = self->_score;
  BOOL v6 = score < 0.0;
  if (score == 0.0)
  {
    unint64_t v11 = 0;
  }
  else
  {
    double v7 = score;
    double v8 = -v7;
    if (!v6) {
      double v8 = v7;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v11 += (unint64_t)v10;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v10);
    }
  }
  float iFunScore = self->_iFunScore;
  BOOL v13 = iFunScore < 0.0;
  if (iFunScore == 0.0)
  {
    unint64_t v18 = 0;
  }
  else
  {
    double v14 = iFunScore;
    double v15 = -v14;
    if (!v13) {
      double v15 = v14;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v18 += (unint64_t)v17;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v17);
    }
  }
  return (2654435761 * scoreConfidence) ^ (2654435761 * domain) ^ v11 ^ v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int domain = self->_domain, domain == [v4 domain])
    && (int scoreConfidence = self->_scoreConfidence, scoreConfidence == [v4 scoreConfidence])
    && (float score = self->_score, [v4 score], score == v8))
  {
    float iFunScore = self->_iFunScore;
    [v4 iFunScore];
    BOOL v9 = iFunScore == v12;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_SFPBDomainEngagementScore *)self domain]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBDomainEngagementScore *)self scoreConfidence]) {
    PBDataWriterWriteInt32Field();
  }
  [(_SFPBDomainEngagementScore *)self score];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_SFPBDomainEngagementScore *)self iFunScore];
  v5 = v7;
  if (v6 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDomainEngagementScoreReadFrom(self, (uint64_t)a3, v3);
}

- (void)setIFunScore:(float)a3
{
  self->_float iFunScore = a3;
}

- (void)setScore:(float)a3
{
  self->_float score = a3;
}

- (void)setScoreConfidence:(int)a3
{
  self->_int scoreConfidence = a3;
}

- (void)setDomain:(int)a3
{
  self->_int domain = a3;
}

@end