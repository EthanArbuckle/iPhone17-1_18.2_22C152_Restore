@interface _SFPBEngagementSignal
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)domainEngagementScores;
- (NSData)jsonData;
- (_SFPBEngagementSignal)initWithDictionary:(id)a3;
- (_SFPBEngagementSignal)initWithFacade:(id)a3;
- (_SFPBEngagementSignal)initWithJSON:(id)a3;
- (float)localScore;
- (float)serverScore;
- (id)dictionaryRepresentation;
- (id)domainEngagementScoresAtIndex:(unint64_t)a3;
- (int)localScoreConfidence;
- (int)serverScoreConfidence;
- (int)version;
- (unint64_t)domainEngagementScoresCount;
- (unint64_t)hash;
- (void)addDomainEngagementScores:(id)a3;
- (void)clearDomainEngagementScores;
- (void)setDomainEngagementScores:(id)a3;
- (void)setLocalScore:(float)a3;
- (void)setLocalScoreConfidence:(int)a3;
- (void)setServerScore:(float)a3;
- (void)setServerScoreConfidence:(int)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBEngagementSignal

- (_SFPBEngagementSignal)initWithFacade:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBEngagementSignal *)self init];
  if (v5)
  {
    v6 = [v4 version];

    if (v6)
    {
      v7 = [v4 version];
      -[_SFPBEngagementSignal setVersion:](v5, "setVersion:", [v7 intValue]);
    }
    v8 = [v4 serverScore];

    if (v8)
    {
      v9 = [v4 serverScore];
      [v9 floatValue];
      -[_SFPBEngagementSignal setServerScore:](v5, "setServerScore:");
    }
    v10 = [v4 localScore];

    if (v10)
    {
      v11 = [v4 localScore];
      [v11 floatValue];
      -[_SFPBEngagementSignal setLocalScore:](v5, "setLocalScore:");
    }
    v12 = [v4 serverScoreConfidence];

    if (v12)
    {
      v13 = [v4 serverScoreConfidence];
      -[_SFPBEngagementSignal setServerScoreConfidence:](v5, "setServerScoreConfidence:", [v13 intValue]);
    }
    v14 = [v4 localScoreConfidence];

    if (v14)
    {
      v15 = [v4 localScoreConfidence];
      -[_SFPBEngagementSignal setLocalScoreConfidence:](v5, "setLocalScoreConfidence:", [v15 intValue]);
    }
    v16 = [v4 domainEngagementScores];
    if (v16) {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v17 = 0;
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v18 = objc_msgSend(v4, "domainEngagementScores", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [[_SFPBDomainEngagementScore alloc] initWithFacade:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          if (v23) {
            [v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }

    [(_SFPBEngagementSignal *)v5 setDomainEngagementScores:v17];
    v24 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (NSArray)domainEngagementScores
{
  return self->_domainEngagementScores;
}

- (int)localScoreConfidence
{
  return self->_localScoreConfidence;
}

- (int)serverScoreConfidence
{
  return self->_serverScoreConfidence;
}

- (float)localScore
{
  return self->_localScore;
}

- (float)serverScore
{
  return self->_serverScore;
}

- (int)version
{
  return self->_version;
}

- (_SFPBEngagementSignal)initWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_SFPBEngagementSignal;
  v5 = [(_SFPBEngagementSignal *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBEngagementSignal setVersion:](v5, "setVersion:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"serverScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[_SFPBEngagementSignal setServerScore:](v5, "setServerScore:");
    }
    v8 = [v4 objectForKeyedSubscript:@"localScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[_SFPBEngagementSignal setLocalScore:](v5, "setLocalScore:");
    }
    v9 = [v4 objectForKeyedSubscript:@"serverScoreConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBEngagementSignal setServerScoreConfidence:](v5, "setServerScoreConfidence:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"localScoreConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBEngagementSignal setLocalScoreConfidence:](v5, "setLocalScoreConfidence:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"domainEngagementScores"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = v10;
      v22 = v9;
      v23 = v6;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [[_SFPBDomainEngagementScore alloc] initWithDictionary:v17];
              [(_SFPBEngagementSignal *)v5 addDomainEngagementScores:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v14);
      }

      v6 = v23;
      v9 = v22;
      v10 = v21;
    }
    uint64_t v19 = v5;
  }
  return v5;
}

- (_SFPBEngagementSignal)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBEngagementSignal *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBEngagementSignal *)self dictionaryRepresentation];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_domainEngagementScores count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v5 = self->_domainEngagementScores;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"domainEngagementScores"];
  }
  if (self->_localScore != 0.0)
  {
    id v12 = NSNumber;
    [(_SFPBEngagementSignal *)self localScore];
    uint64_t v13 = objc_msgSend(v12, "numberWithFloat:");
    [v3 setObject:v13 forKeyedSubscript:@"localScore"];
  }
  if (self->_localScoreConfidence)
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBEngagementSignal localScoreConfidence](self, "localScoreConfidence"));
    [v3 setObject:v14 forKeyedSubscript:@"localScoreConfidence"];
  }
  if (self->_serverScore != 0.0)
  {
    uint64_t v15 = NSNumber;
    [(_SFPBEngagementSignal *)self serverScore];
    v16 = objc_msgSend(v15, "numberWithFloat:");
    [v3 setObject:v16 forKeyedSubscript:@"serverScore"];
  }
  if (self->_serverScoreConfidence)
  {
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBEngagementSignal serverScoreConfidence](self, "serverScoreConfidence"));
    [v3 setObject:v17 forKeyedSubscript:@"serverScoreConfidence"];
  }
  if (self->_version)
  {
    v18 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBEngagementSignal version](self, "version"));
    [v3 setObject:v18 forKeyedSubscript:@"version"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t version = self->_version;
  float serverScore = self->_serverScore;
  BOOL v5 = serverScore < 0.0;
  if (serverScore == 0.0)
  {
    unint64_t v10 = 0;
  }
  else
  {
    double v6 = serverScore;
    double v7 = -v6;
    if (!v5) {
      double v7 = v6;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v10 += (unint64_t)v9;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v9);
    }
  }
  float localScore = self->_localScore;
  BOOL v12 = localScore < 0.0;
  if (localScore == 0.0)
  {
    unint64_t v17 = 0;
  }
  else
  {
    double v13 = localScore;
    double v14 = -v13;
    if (!v12) {
      double v14 = v13;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v17 += (unint64_t)v16;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v16);
    }
  }
  uint64_t v18 = v10 ^ v17 ^ (2654435761 * version) ^ (2654435761 * self->_serverScoreConfidence) ^ (2654435761
                                                                                              * self->_localScoreConfidence);
  return v18 ^ [(NSArray *)self->_domainEngagementScores hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int version = self->_version;
    if (version == [v4 version])
    {
      float serverScore = self->_serverScore;
      [v4 serverScore];
      if (serverScore == v7)
      {
        float localScore = self->_localScore;
        [v4 localScore];
        if (localScore == v9)
        {
          int serverScoreConfidence = self->_serverScoreConfidence;
          if (serverScoreConfidence == [v4 serverScoreConfidence])
          {
            int localScoreConfidence = self->_localScoreConfidence;
            if (localScoreConfidence == [v4 localScoreConfidence])
            {
              BOOL v12 = [(_SFPBEngagementSignal *)self domainEngagementScores];
              double v13 = [v4 domainEngagementScores];
              double v14 = v13;
              if ((v12 == 0) != (v13 != 0))
              {
                uint64_t v15 = [(_SFPBEngagementSignal *)self domainEngagementScores];
                if (!v15)
                {

LABEL_15:
                  BOOL v20 = 1;
                  goto LABEL_13;
                }
                double v16 = (void *)v15;
                unint64_t v17 = [(_SFPBEngagementSignal *)self domainEngagementScores];
                uint64_t v18 = [v4 domainEngagementScores];
                char v19 = [v17 isEqual:v18];

                if (v19) {
                  goto LABEL_15;
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
  BOOL v20 = 0;
LABEL_13:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_SFPBEngagementSignal *)self version]) {
    PBDataWriterWriteInt32Field();
  }
  [(_SFPBEngagementSignal *)self serverScore];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_SFPBEngagementSignal *)self localScore];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_SFPBEngagementSignal *)self serverScoreConfidence]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBEngagementSignal *)self localScoreConfidence]) {
    PBDataWriterWriteInt32Field();
  }
  float v7 = [(_SFPBEngagementSignal *)self domainEngagementScores];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBEngagementSignalReadFrom(self, (uint64_t)a3, v3);
}

- (id)domainEngagementScoresAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_domainEngagementScores objectAtIndexedSubscript:a3];
}

- (unint64_t)domainEngagementScoresCount
{
  return [(NSArray *)self->_domainEngagementScores count];
}

- (void)addDomainEngagementScores:(id)a3
{
  id v4 = a3;
  domainEngagementScores = self->_domainEngagementScores;
  id v8 = v4;
  if (!domainEngagementScores)
  {
    float v6 = [MEMORY[0x1E4F1CA48] array];
    float v7 = self->_domainEngagementScores;
    self->_domainEngagementScores = v6;

    id v4 = v8;
    domainEngagementScores = self->_domainEngagementScores;
  }
  [(NSArray *)domainEngagementScores addObject:v4];
}

- (void)clearDomainEngagementScores
{
}

- (void)setDomainEngagementScores:(id)a3
{
  self->_domainEngagementScores = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLocalScoreConfidence:(int)a3
{
  self->_int localScoreConfidence = a3;
}

- (void)setServerScoreConfidence:(int)a3
{
  self->_int serverScoreConfidence = a3;
}

- (void)setLocalScore:(float)a3
{
  self->_float localScore = a3;
}

- (void)setServerScore:(float)a3
{
  self->_float serverScore = a3;
}

- (void)setVersion:(int)a3
{
  self->_int version = a3;
}

@end