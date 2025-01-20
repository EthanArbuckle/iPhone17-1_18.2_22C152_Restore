@interface VISBoxScorerConfig
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (VISBoxScorerConfig)initWithDictionary:(id)a3;
- (VISBoxScorerConfig)initWithJSON:(id)a3;
- (double)std;
- (double)xmean;
- (double)ymean;
- (id)dictionaryRepresentation;
- (int)granularity;
- (unint64_t)hash;
- (void)setGranularity:(int)a3;
- (void)setStd:(double)a3;
- (void)setXmean:(double)a3;
- (void)setYmean:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation VISBoxScorerConfig

- (void)setGranularity:(int)a3
{
  self->_granularity = a3;
}

- (void)setXmean:(double)a3
{
  self->_xmean = a3;
}

- (void)setYmean:(double)a3
{
  self->_ymean = a3;
}

- (void)setStd:(double)a3
{
  self->_std = a3;
}

- (BOOL)readFrom:(id)a3
{
  return VISBoxScorerConfigReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ([(VISBoxScorerConfig *)self granularity]) {
    PBDataWriterWriteInt32Field();
  }
  [(VISBoxScorerConfig *)self xmean];
  if (v4 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(VISBoxScorerConfig *)self ymean];
  if (v5 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(VISBoxScorerConfig *)self std];
  v6 = v8;
  if (v7 != 0.0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v8;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int granularity = self->_granularity, granularity == [v4 granularity])
    && (double xmean = self->_xmean, [v4 xmean], xmean == v7)
    && (double ymean = self->_ymean, [v4 ymean], ymean == v9))
  {
    double std = self->_std;
    [v4 std];
    BOOL v10 = std == v13;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t granularity = self->_granularity;
  double xmean = self->_xmean;
  if (xmean == 0.0)
  {
    unint64_t v8 = 0;
  }
  else
  {
    double v5 = -xmean;
    if (xmean >= 0.0) {
      double v5 = self->_xmean;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v8 += (unint64_t)v7;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v7);
    }
  }
  double ymean = self->_ymean;
  if (ymean == 0.0)
  {
    unint64_t v13 = 0;
  }
  else
  {
    double v10 = -ymean;
    if (ymean >= 0.0) {
      double v10 = self->_ymean;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v13 += (unint64_t)v12;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v12);
    }
  }
  double std = self->_std;
  if (std == 0.0)
  {
    unint64_t v18 = 0;
  }
  else
  {
    double v15 = -std;
    if (std >= 0.0) {
      double v15 = self->_std;
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
  return v8 ^ v13 ^ v18 ^ (2654435761 * granularity);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_granularity)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[VISBoxScorerConfig granularity](self, "granularity"));
    [v3 setObject:v4 forKeyedSubscript:@"granularity"];
  }
  if (self->_std != 0.0)
  {
    double v5 = NSNumber;
    [(VISBoxScorerConfig *)self std];
    long double v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"std"];
  }
  if (self->_xmean != 0.0)
  {
    double v7 = NSNumber;
    [(VISBoxScorerConfig *)self xmean];
    unint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"xmean"];
  }
  if (self->_ymean != 0.0)
  {
    double v9 = NSNumber;
    [(VISBoxScorerConfig *)self ymean];
    double v10 = objc_msgSend(v9, "numberWithDouble:");
    [v3 setObject:v10 forKeyedSubscript:@"ymean"];
  }
  return v3;
}

- (NSData)jsonData
{
  v2 = [(VISBoxScorerConfig *)self dictionaryRepresentation];
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

- (VISBoxScorerConfig)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = 0;
  }
  else
  {
    self = [(VISBoxScorerConfig *)self initWithDictionary:v4];
    double v5 = self;
  }

  return v5;
}

- (VISBoxScorerConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VISBoxScorerConfig;
  double v5 = [(VISBoxScorerConfig *)&v12 init];
  if (v5)
  {
    long double v6 = [v4 objectForKeyedSubscript:@"granularity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISBoxScorerConfig setGranularity:](v5, "setGranularity:", [v6 intValue]);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"xmean"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[VISBoxScorerConfig setXmean:](v5, "setXmean:");
    }
    unint64_t v8 = [v4 objectForKeyedSubscript:@"ymean"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[VISBoxScorerConfig setYmean:](v5, "setYmean:");
    }
    double v9 = [v4 objectForKeyedSubscript:@"std"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[VISBoxScorerConfig setStd:](v5, "setStd:");
    }
    double v10 = v5;
  }
  return v5;
}

- (int)granularity
{
  return self->_granularity;
}

- (double)xmean
{
  return self->_xmean;
}

- (double)ymean
{
  return self->_ymean;
}

- (double)std
{
  return self->_std;
}

@end