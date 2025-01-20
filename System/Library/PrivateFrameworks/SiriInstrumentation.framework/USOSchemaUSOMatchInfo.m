@interface USOSchemaUSOMatchInfo
- (BOOL)hasEditDistance;
- (BOOL)hasMatchScore;
- (BOOL)hasMatchSignalBitset;
- (BOOL)hasMatchedAliasCount;
- (BOOL)hasMatchedStopWordCount;
- (BOOL)hasMatchedTokenCount;
- (BOOL)hasMaxAliasCount;
- (BOOL)hasMaxStopWordCount;
- (BOOL)hasMaxTokenCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)matchedAliasTypes;
- (NSData)jsonData;
- (USOSchemaUSOMatchInfo)initWithDictionary:(id)a3;
- (USOSchemaUSOMatchInfo)initWithJSON:(id)a3;
- (float)matchScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)matchedAliasTypesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matchedAliasTypesCount;
- (unsigned)editDistance;
- (unsigned)matchSignalBitset;
- (unsigned)matchedAliasCount;
- (unsigned)matchedStopWordCount;
- (unsigned)matchedTokenCount;
- (unsigned)maxAliasCount;
- (unsigned)maxStopWordCount;
- (unsigned)maxTokenCount;
- (void)addMatchedAliasTypes:(int)a3;
- (void)clearMatchedAliasTypes;
- (void)deleteEditDistance;
- (void)deleteMatchScore;
- (void)deleteMatchSignalBitset;
- (void)deleteMatchedAliasCount;
- (void)deleteMatchedStopWordCount;
- (void)deleteMatchedTokenCount;
- (void)deleteMaxAliasCount;
- (void)deleteMaxStopWordCount;
- (void)deleteMaxTokenCount;
- (void)setEditDistance:(unsigned int)a3;
- (void)setHasEditDistance:(BOOL)a3;
- (void)setHasMatchScore:(BOOL)a3;
- (void)setHasMatchSignalBitset:(BOOL)a3;
- (void)setHasMatchedAliasCount:(BOOL)a3;
- (void)setHasMatchedStopWordCount:(BOOL)a3;
- (void)setHasMatchedTokenCount:(BOOL)a3;
- (void)setHasMaxAliasCount:(BOOL)a3;
- (void)setHasMaxStopWordCount:(BOOL)a3;
- (void)setHasMaxTokenCount:(BOOL)a3;
- (void)setMatchScore:(float)a3;
- (void)setMatchSignalBitset:(unsigned int)a3;
- (void)setMatchedAliasCount:(unsigned int)a3;
- (void)setMatchedAliasTypes:(id)a3;
- (void)setMatchedStopWordCount:(unsigned int)a3;
- (void)setMatchedTokenCount:(unsigned int)a3;
- (void)setMaxAliasCount:(unsigned int)a3;
- (void)setMaxStopWordCount:(unsigned int)a3;
- (void)setMaxTokenCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOMatchInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setMatchedAliasTypes:(id)a3
{
}

- (NSArray)matchedAliasTypes
{
  return self->_matchedAliasTypes;
}

- (unsigned)matchedAliasCount
{
  return self->_matchedAliasCount;
}

- (unsigned)maxAliasCount
{
  return self->_maxAliasCount;
}

- (unsigned)editDistance
{
  return self->_editDistance;
}

- (unsigned)matchedStopWordCount
{
  return self->_matchedStopWordCount;
}

- (unsigned)maxStopWordCount
{
  return self->_maxStopWordCount;
}

- (unsigned)matchedTokenCount
{
  return self->_matchedTokenCount;
}

- (unsigned)maxTokenCount
{
  return self->_maxTokenCount;
}

- (float)matchScore
{
  return self->_matchScore;
}

- (unsigned)matchSignalBitset
{
  return self->_matchSignalBitset;
}

- (USOSchemaUSOMatchInfo)initWithDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)USOSchemaUSOMatchInfo;
  v5 = [(USOSchemaUSOMatchInfo *)&v36 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"matchSignalBitset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOMatchInfo setMatchSignalBitset:](v5, "setMatchSignalBitset:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"matchScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[USOSchemaUSOMatchInfo setMatchScore:](v5, "setMatchScore:");
    }
    v8 = [v4 objectForKeyedSubscript:@"maxTokenCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOMatchInfo setMaxTokenCount:](v5, "setMaxTokenCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"matchedTokenCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOMatchInfo setMatchedTokenCount:](v5, "setMatchedTokenCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"maxStopWordCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOMatchInfo setMaxStopWordCount:](v5, "setMaxStopWordCount:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"matchedStopWordCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOMatchInfo setMatchedStopWordCount:](v5, "setMatchedStopWordCount:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"editDistance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOMatchInfo setEditDistance:](v5, "setEditDistance:", [v12 unsignedIntValue]);
    }
    v31 = v11;
    v13 = [v4 objectForKeyedSubscript:@"maxAliasCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOMatchInfo setMaxAliasCount:](v5, "setMaxAliasCount:", [v13 unsignedIntValue]);
    }
    v29 = v13;
    v30 = v12;
    v14 = [v4 objectForKeyedSubscript:@"matchedAliasCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOMatchInfo setMatchedAliasCount:](v5, "setMatchedAliasCount:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"matchedAliasTypes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v10;
      v25 = v9;
      v26 = v8;
      v27 = v7;
      v28 = v6;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v33;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v32 + 1) + 8 * v20);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[USOSchemaUSOMatchInfo addMatchedAliasTypes:](v5, "addMatchedAliasTypes:", [v21 intValue]);
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v18);
      }

      v7 = v27;
      v6 = v28;
      v9 = v25;
      v8 = v26;
      v10 = v24;
    }
    v22 = v5;
  }
  return v5;
}

- (USOSchemaUSOMatchInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOMatchInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOMatchInfo *)self dictionaryRepresentation];
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo editDistance](self, "editDistance"));
    [v3 setObject:v11 forKeyedSubscript:@"editDistance"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v12 = NSNumber;
  [(USOSchemaUSOMatchInfo *)self matchScore];
  v13 = objc_msgSend(v12, "numberWithFloat:");
  [v3 setObject:v13 forKeyedSubscript:@"matchScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo matchSignalBitset](self, "matchSignalBitset"));
  [v3 setObject:v14 forKeyedSubscript:@"matchSignalBitset"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo matchedAliasCount](self, "matchedAliasCount"));
    [v3 setObject:v5 forKeyedSubscript:@"matchedAliasCount"];
  }
LABEL_6:
  if ([(NSArray *)self->_matchedAliasTypes count])
  {
    v6 = [(USOSchemaUSOMatchInfo *)self matchedAliasTypes];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"matchedAliasTypes"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo matchedStopWordCount](self, "matchedStopWordCount"));
    [v3 setObject:v15 forKeyedSubscript:@"matchedStopWordCount"];

    __int16 v8 = (__int16)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_10:
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      goto LABEL_23;
    }
  }
  else if ((v8 & 8) == 0)
  {
    goto LABEL_10;
  }
  id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo matchedTokenCount](self, "matchedTokenCount"));
  [v3 setObject:v16 forKeyedSubscript:@"matchedTokenCount"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x80) == 0)
  {
LABEL_11:
    if ((v8 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo maxAliasCount](self, "maxAliasCount"));
  [v3 setObject:v17 forKeyedSubscript:@"maxAliasCount"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_12:
    if ((v8 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_24:
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo maxStopWordCount](self, "maxStopWordCount"));
  [v3 setObject:v18 forKeyedSubscript:@"maxStopWordCount"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_13:
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo maxTokenCount](self, "maxTokenCount"));
    [v3 setObject:v9 forKeyedSubscript:@"maxTokenCount"];
  }
LABEL_14:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_matchSignalBitset;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float matchScore = self->_matchScore;
  double v6 = matchScore;
  if (matchScore < 0.0) {
    double v6 = -matchScore;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_maxTokenCount;
    if ((has & 8) != 0)
    {
LABEL_13:
      uint64_t v11 = 2654435761 * self->_matchedTokenCount;
      if ((has & 0x10) != 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v11 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_14:
    uint64_t v12 = 2654435761 * self->_maxStopWordCount;
    if ((has & 0x20) != 0) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v12 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_15:
    uint64_t v13 = 2654435761 * self->_matchedStopWordCount;
    if ((has & 0x40) != 0) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v13 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_16:
    uint64_t v14 = 2654435761 * self->_editDistance;
    if ((has & 0x80) != 0) {
      goto LABEL_17;
    }
LABEL_24:
    uint64_t v15 = 0;
    if ((has & 0x100) != 0) {
      goto LABEL_18;
    }
LABEL_25:
    uint64_t v16 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NSArray *)self->_matchedAliasTypes hash];
  }
LABEL_23:
  uint64_t v14 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_24;
  }
LABEL_17:
  uint64_t v15 = 2654435761 * self->_maxAliasCount;
  if ((has & 0x100) == 0) {
    goto LABEL_25;
  }
LABEL_18:
  uint64_t v16 = 2654435761 * self->_matchedAliasCount;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NSArray *)self->_matchedAliasTypes hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  $82F105DB2C6B60213E4FE09A026515AB has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int matchSignalBitset = self->_matchSignalBitset;
    if (matchSignalBitset != [v4 matchSignalBitset]) {
      goto LABEL_42;
    }
    $82F105DB2C6B60213E4FE09A026515AB has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      float matchScore = self->_matchScore;
      [v4 matchScore];
      if (matchScore != v10) {
        goto LABEL_42;
      }
      $82F105DB2C6B60213E4FE09A026515AB has = self->_has;
      unsigned int v6 = v4[28];
    }
    int v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (v11)
      {
        unsigned int maxTokenCount = self->_maxTokenCount;
        if (maxTokenCount != [v4 maxTokenCount]) {
          goto LABEL_42;
        }
        $82F105DB2C6B60213E4FE09A026515AB has = self->_has;
        unsigned int v6 = v4[28];
      }
      int v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          unsigned int matchedTokenCount = self->_matchedTokenCount;
          if (matchedTokenCount != [v4 matchedTokenCount]) {
            goto LABEL_42;
          }
          $82F105DB2C6B60213E4FE09A026515AB has = self->_has;
          unsigned int v6 = v4[28];
        }
        int v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 == ((v6 >> 4) & 1))
        {
          if (v15)
          {
            unsigned int maxStopWordCount = self->_maxStopWordCount;
            if (maxStopWordCount != [v4 maxStopWordCount]) {
              goto LABEL_42;
            }
            $82F105DB2C6B60213E4FE09A026515AB has = self->_has;
            unsigned int v6 = v4[28];
          }
          int v17 = (*(unsigned int *)&has >> 5) & 1;
          if (v17 == ((v6 >> 5) & 1))
          {
            if (v17)
            {
              unsigned int matchedStopWordCount = self->_matchedStopWordCount;
              if (matchedStopWordCount != [v4 matchedStopWordCount]) {
                goto LABEL_42;
              }
              $82F105DB2C6B60213E4FE09A026515AB has = self->_has;
              unsigned int v6 = v4[28];
            }
            int v19 = (*(unsigned int *)&has >> 6) & 1;
            if (v19 == ((v6 >> 6) & 1))
            {
              if (v19)
              {
                unsigned int editDistance = self->_editDistance;
                if (editDistance != [v4 editDistance]) {
                  goto LABEL_42;
                }
                $82F105DB2C6B60213E4FE09A026515AB has = self->_has;
                unsigned int v6 = v4[28];
              }
              int v21 = (*(unsigned int *)&has >> 7) & 1;
              if (v21 == ((v6 >> 7) & 1))
              {
                if (v21)
                {
                  unsigned int maxAliasCount = self->_maxAliasCount;
                  if (maxAliasCount != [v4 maxAliasCount]) {
                    goto LABEL_42;
                  }
                  $82F105DB2C6B60213E4FE09A026515AB has = self->_has;
                  unsigned int v6 = v4[28];
                }
                int v23 = (*(unsigned int *)&has >> 8) & 1;
                if (v23 == ((v6 >> 8) & 1))
                {
                  if (!v23
                    || (unsigned int matchedAliasCount = self->_matchedAliasCount,
                        matchedAliasCount == [v4 matchedAliasCount]))
                  {
                    v25 = [(USOSchemaUSOMatchInfo *)self matchedAliasTypes];
                    v26 = [v4 matchedAliasTypes];
                    v27 = v26;
                    if ((v25 == 0) != (v26 != 0))
                    {
                      uint64_t v28 = [(USOSchemaUSOMatchInfo *)self matchedAliasTypes];
                      if (!v28)
                      {

LABEL_45:
                        BOOL v33 = 1;
                        goto LABEL_43;
                      }
                      v29 = (void *)v28;
                      v30 = [(USOSchemaUSOMatchInfo *)self matchedAliasTypes];
                      v31 = [v4 matchedAliasTypes];
                      char v32 = [v30 isEqual:v31];

                      if (v32) {
                        goto LABEL_45;
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
      }
    }
  }
LABEL_42:
  BOOL v33 = 0;
LABEL_43:

  return v33;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_matchedAliasTypes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "intValue", (void)v11);
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOMatchInfoReadFrom(self, (uint64_t)a3, v3);
}

- (int)matchedAliasTypesAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_matchedAliasTypes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)matchedAliasTypesCount
{
  return [(NSArray *)self->_matchedAliasTypes count];
}

- (void)addMatchedAliasTypes:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  matchedAliasTypes = self->_matchedAliasTypes;
  if (!matchedAliasTypes)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matchedAliasTypes;
    self->_matchedAliasTypes = v6;

    matchedAliasTypes = self->_matchedAliasTypes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)matchedAliasTypes addObject:v8];
}

- (void)clearMatchedAliasTypes
{
}

- (void)deleteMatchedAliasCount
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasMatchedAliasCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMatchedAliasCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMatchedAliasCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int matchedAliasCount = a3;
}

- (void)deleteMaxAliasCount
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasMaxAliasCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMaxAliasCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMaxAliasCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int maxAliasCount = a3;
}

- (void)deleteEditDistance
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasEditDistance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEditDistance
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setEditDistance:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int editDistance = a3;
}

- (void)deleteMatchedStopWordCount
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasMatchedStopWordCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMatchedStopWordCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMatchedStopWordCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int matchedStopWordCount = a3;
}

- (void)deleteMaxStopWordCount
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasMaxStopWordCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMaxStopWordCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMaxStopWordCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int maxStopWordCount = a3;
}

- (void)deleteMatchedTokenCount
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasMatchedTokenCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMatchedTokenCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setMatchedTokenCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int matchedTokenCount = a3;
}

- (void)deleteMaxTokenCount
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasMaxTokenCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMaxTokenCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMaxTokenCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int maxTokenCount = a3;
}

- (void)deleteMatchScore
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasMatchScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMatchScore
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMatchScore:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_float matchScore = a3;
}

- (void)deleteMatchSignalBitset
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasMatchSignalBitset:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasMatchSignalBitset
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMatchSignalBitset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int matchSignalBitset = a3;
}

@end