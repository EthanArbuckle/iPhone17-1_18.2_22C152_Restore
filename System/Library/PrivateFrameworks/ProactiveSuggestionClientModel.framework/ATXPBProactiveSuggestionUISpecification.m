@interface ATXPBProactiveSuggestionUISpecification
+ (uint64_t)preferredLayoutConfigsType;
- (BOOL)allowedOnHomeScreen;
- (BOOL)allowedOnLockscreen;
- (BOOL)allowedOnSpotlight;
- (BOOL)hasReason;
- (BOOL)hasSubtitle;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldClearOnEngagement;
- (double)contextEndDate;
- (double)contextStartDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)preferredLayoutConfigsAtIndex:(id *)a1;
- (uint64_t)addPreferredLayoutConfigs:(uint64_t)a1;
- (uint64_t)clearPreferredLayoutConfigs;
- (uint64_t)hasAllowedOnHomeScreen;
- (uint64_t)hasAllowedOnLockscreen;
- (uint64_t)hasAllowedOnSpotlight;
- (uint64_t)hasContextEndDate;
- (uint64_t)hasContextStartDate;
- (uint64_t)hasPredictionReasons;
- (uint64_t)hasShouldClearOnEngagement;
- (uint64_t)predictionReasons;
- (uint64_t)preferredLayoutConfigs;
- (uint64_t)preferredLayoutConfigsCount;
- (uint64_t)reason;
- (uint64_t)setAllowedOnHomeScreen:(uint64_t)result;
- (uint64_t)setAllowedOnLockscreen:(uint64_t)result;
- (uint64_t)setAllowedOnSpotlight:(uint64_t)result;
- (uint64_t)setContextEndDate:(uint64_t)result;
- (uint64_t)setContextStartDate:(uint64_t)result;
- (uint64_t)setHasAllowedOnHomeScreen:(uint64_t)result;
- (uint64_t)setHasAllowedOnLockscreen:(uint64_t)result;
- (uint64_t)setHasAllowedOnSpotlight:(uint64_t)result;
- (uint64_t)setHasContextEndDate:(uint64_t)result;
- (uint64_t)setHasContextStartDate:(uint64_t)result;
- (uint64_t)setHasPredictionReasons:(uint64_t)result;
- (uint64_t)setHasShouldClearOnEngagement:(uint64_t)result;
- (uint64_t)setPredictionReasons:(uint64_t)result;
- (uint64_t)setShouldClearOnEngagement:(uint64_t)result;
- (uint64_t)subtitle;
- (uint64_t)title;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setPreferredLayoutConfigs:(uint64_t)a1;
- (void)setReason:(uint64_t)a1;
- (void)setSubtitle:(uint64_t)a1;
- (void)setTitle:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBProactiveSuggestionUISpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_preferredLayoutConfigs, 0);
}

- (uint64_t)addPreferredLayoutConfigs:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)preferredLayoutConfigs
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)title
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (BOOL)shouldClearOnEngagement
{
  if (result) {
    return *(unsigned char *)(result + 67) != 0;
  }
  return result;
}

- (uint64_t)reason
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)predictionReasons
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)hasContextStartDate
{
  if (result) {
    return (*(unsigned __int8 *)(result + 68) >> 1) & 1;
  }
  return result;
}

- (uint64_t)hasContextEndDate
{
  if (result) {
    return *(unsigned char *)(result + 68) & 1;
  }
  return result;
}

- (BOOL)allowedOnSpotlight
{
  if (result) {
    return *(unsigned char *)(result + 66) != 0;
  }
  return result;
}

- (BOOL)allowedOnLockscreen
{
  if (result) {
    return *(unsigned char *)(result + 65) != 0;
  }
  return result;
}

- (BOOL)allowedOnHomeScreen
{
  if (result) {
    return *(unsigned char *)(result + 64) != 0;
  }
  return result;
}

- (uint64_t)subtitle
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (BOOL)hasTitle
{
  if (result) {
    return *(void *)(result + 56) != 0;
  }
  return result;
}

- (BOOL)hasSubtitle
{
  if (result) {
    return *(void *)(result + 48) != 0;
  }
  return result;
}

- (BOOL)hasReason
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

- (uint64_t)clearPreferredLayoutConfigs
{
  if (result) {
    return [*(id *)(result + 32) removeAllObjects];
  }
  return result;
}

- (uint64_t)preferredLayoutConfigsCount
{
  if (result) {
    return [*(id *)(result + 32) count];
  }
  return result;
}

- (id)preferredLayoutConfigsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[4] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)preferredLayoutConfigsType
{
  self;
  return objc_opt_class();
}

- (uint64_t)setAllowedOnLockscreen:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 68) |= 0x10u;
    *(unsigned char *)(result + 65) = a2;
  }
  return result;
}

- (uint64_t)setHasAllowedOnLockscreen:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 16;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 68) = *(unsigned char *)(result + 68) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasAllowedOnLockscreen
{
  if (result) {
    return (*(unsigned __int8 *)(result + 68) >> 4) & 1;
  }
  return result;
}

- (uint64_t)setAllowedOnHomeScreen:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 68) |= 8u;
    *(unsigned char *)(result + 64) = a2;
  }
  return result;
}

- (uint64_t)setHasAllowedOnHomeScreen:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 68) = *(unsigned char *)(result + 68) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasAllowedOnHomeScreen
{
  if (result) {
    return (*(unsigned __int8 *)(result + 68) >> 3) & 1;
  }
  return result;
}

- (uint64_t)setAllowedOnSpotlight:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 68) |= 0x20u;
    *(unsigned char *)(result + 66) = a2;
  }
  return result;
}

- (uint64_t)setHasAllowedOnSpotlight:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 32;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 68) = *(unsigned char *)(result + 68) & 0xDF | v2;
  }
  return result;
}

- (uint64_t)hasAllowedOnSpotlight
{
  if (result) {
    return (*(unsigned __int8 *)(result + 68) >> 5) & 1;
  }
  return result;
}

- (uint64_t)setShouldClearOnEngagement:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 68) |= 0x40u;
    *(unsigned char *)(result + 67) = a2;
  }
  return result;
}

- (uint64_t)setHasShouldClearOnEngagement:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 64;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 68) = *(unsigned char *)(result + 68) & 0xBF | v2;
  }
  return result;
}

- (uint64_t)hasShouldClearOnEngagement
{
  if (result) {
    return (*(unsigned __int8 *)(result + 68) >> 6) & 1;
  }
  return result;
}

- (uint64_t)setPredictionReasons:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 68) |= 4u;
    *(void *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setHasPredictionReasons:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 68) = *(unsigned char *)(result + 68) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasPredictionReasons
{
  if (result) {
    return (*(unsigned __int8 *)(result + 68) >> 2) & 1;
  }
  return result;
}

- (uint64_t)setContextStartDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 68) |= 2u;
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasContextStartDate:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 68) = *(unsigned char *)(result + 68) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)setContextEndDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 68) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasContextEndDate:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 68) = *(unsigned char *)(result + 68) & 0xFE | a2;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBProactiveSuggestionUISpecification;
  id v4 = [(ATXPBProactiveSuggestionUISpecification *)&v8 description];
  v5 = [(ATXPBProactiveSuggestionUISpecification *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  reason = self->_reason;
  if (reason) {
    [v4 setObject:reason forKey:@"reason"];
  }
  if ([(NSMutableArray *)self->_preferredLayoutConfigs count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_preferredLayoutConfigs, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = self->_preferredLayoutConfigs;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (void)v24);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"preferredLayoutConfigs"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v18 = [NSNumber numberWithBool:self->_allowedOnLockscreen];
    [v4 setObject:v18 forKey:@"allowedOnLockscreen"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_18:
      if ((has & 0x20) == 0) {
        goto LABEL_19;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_18;
  }
  v19 = objc_msgSend(NSNumber, "numberWithBool:", self->_allowedOnHomeScreen, (void)v24);
  [v4 setObject:v19 forKey:@"allowedOnHomeScreen"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_19:
    if ((has & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_30;
  }
LABEL_29:
  v20 = objc_msgSend(NSNumber, "numberWithBool:", self->_allowedOnSpotlight, (void)v24);
  [v4 setObject:v20 forKey:@"allowedOnSpotlight"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_20:
    if ((has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }
LABEL_30:
  v21 = objc_msgSend(NSNumber, "numberWithBool:", self->_shouldClearOnEngagement, (void)v24);
  [v4 setObject:v21 forKey:@"shouldClearOnEngagement"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_21:
    if ((has & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_32;
  }
LABEL_31:
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_predictionReasons, (void)v24);
  [v4 setObject:v22 forKey:@"predictionReasons"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_22:
    if ((has & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_32:
  v23 = objc_msgSend(NSNumber, "numberWithDouble:", self->_contextStartDate, (void)v24);
  [v4 setObject:v23 forKey:@"contextStartDate"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_23:
    v16 = objc_msgSend(NSNumber, "numberWithDouble:", self->_contextEndDate, (void)v24);
    [v4 setObject:v16 forKey:@"contextEndDate"];
  }
LABEL_24:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionUISpecificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_reason) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_preferredLayoutConfigs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_16:
      if ((has & 0x20) == 0) {
        goto LABEL_17;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_19:
    if ((has & 2) == 0) {
      goto LABEL_20;
    }
LABEL_28:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_28;
  }
LABEL_20:
  if (has) {
LABEL_21:
  }
    PBDataWriterWriteDoubleField();
LABEL_22:
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_25;
  }
  id v4 = *(void **)(a1 + 56);
  long long v12 = v3;
  if (v4) {
    -[ATXPBProactiveSuggestionUISpecification setTitle:]((uint64_t)v3, v4);
  }
  v5 = *(void **)(a1 + 48);
  if (v5) {
    -[ATXPBProactiveSuggestionUISpecification setSubtitle:]((uint64_t)v12, v5);
  }
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6) {
    -[ATXPBProactiveSuggestionUISpecification setReason:]((uint64_t)v12, v6);
  }
  if ([*(id *)(a1 + 32) count])
  {
    if (v12) {
      [v12[4] removeAllObjects];
    }
    uint64_t v7 = [*(id *)(a1 + 32) count];
    if (v7)
    {
      uint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = -[ATXPBProactiveSuggestionUISpecification preferredLayoutConfigsAtIndex:]((id *)a1, i);
        -[ATXPBProactiveSuggestionUISpecification addPreferredLayoutConfigs:]((uint64_t)v12, v10);
      }
    }
  }
  char v11 = *(unsigned char *)(a1 + 68);
  if ((v11 & 0x10) != 0)
  {
    id v3 = v12;
    *((unsigned char *)v12 + 65) = *(unsigned char *)(a1 + 65);
    *((unsigned char *)v12 + 68) |= 0x10u;
    char v11 = *(unsigned char *)(a1 + 68);
    if ((v11 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  id v3 = v12;
  if ((*(unsigned char *)(a1 + 68) & 8) != 0)
  {
LABEL_18:
    *((unsigned char *)v3 + 64) = *(unsigned char *)(a1 + 64);
    *((unsigned char *)v3 + 68) |= 8u;
    char v11 = *(unsigned char *)(a1 + 68);
  }
LABEL_19:
  if ((v11 & 0x20) != 0)
  {
    *((unsigned char *)v3 + 66) = *(unsigned char *)(a1 + 66);
    *((unsigned char *)v3 + 68) |= 0x20u;
    char v11 = *(unsigned char *)(a1 + 68);
    if ((v11 & 0x40) == 0)
    {
LABEL_21:
      if ((v11 & 4) == 0) {
        goto LABEL_22;
      }
LABEL_30:
      v3[3] = *(id *)(a1 + 24);
      *((unsigned char *)v3 + 68) |= 4u;
      char v11 = *(unsigned char *)(a1 + 68);
      if ((v11 & 2) == 0)
      {
LABEL_23:
        if ((v11 & 1) == 0) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      goto LABEL_31;
    }
  }
  else if ((v11 & 0x40) == 0)
  {
    goto LABEL_21;
  }
  *((unsigned char *)v3 + 67) = *(unsigned char *)(a1 + 67);
  *((unsigned char *)v3 + 68) |= 0x40u;
  char v11 = *(unsigned char *)(a1 + 68);
  if ((v11 & 4) != 0) {
    goto LABEL_30;
  }
LABEL_22:
  if ((v11 & 2) == 0) {
    goto LABEL_23;
  }
LABEL_31:
  v3[2] = *(id *)(a1 + 16);
  *((unsigned char *)v3 + 68) |= 2u;
  if (*(unsigned char *)(a1 + 68))
  {
LABEL_24:
    v3[1] = *(id *)(a1 + 8);
    *((unsigned char *)v3 + 68) |= 1u;
  }
LABEL_25:
}

- (void)setTitle:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setSubtitle:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setReason:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_subtitle copyWithZone:a3];
  id v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_reason copyWithZone:a3];
  char v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v12 = self->_preferredLayoutConfigs;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        -[ATXPBProactiveSuggestionUISpecification addPreferredLayoutConfigs:](v5, v17);
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 65) = self->_allowedOnLockscreen;
    *(unsigned char *)(v5 + 68) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 64) = self->_allowedOnHomeScreen;
  *(unsigned char *)(v5 + 68) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(unsigned char *)(v5 + 66) = self->_allowedOnSpotlight;
  *(unsigned char *)(v5 + 68) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(unsigned char *)(v5 + 67) = self->_shouldClearOnEngagement;
  *(unsigned char *)(v5 + 68) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
LABEL_22:
    *(double *)(v5 + 16) = self->_contextStartDate;
    *(unsigned char *)(v5 + 68) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_15;
  }
LABEL_21:
  *(void *)(v5 + 24) = self->_predictionReasons;
  *(unsigned char *)(v5 + 68) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_22;
  }
LABEL_14:
  if (has)
  {
LABEL_15:
    *(double *)(v5 + 8) = self->_contextEndDate;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_56;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_56;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_56;
    }
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](reason, "isEqual:")) {
      goto LABEL_56;
    }
  }
  preferredLayoutConfigs = self->_preferredLayoutConfigs;
  if ((unint64_t)preferredLayoutConfigs | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](preferredLayoutConfigs, "isEqual:")) {
      goto LABEL_56;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0) {
      goto LABEL_56;
    }
    if (self->_allowedOnLockscreen)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_56;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0) {
      goto LABEL_56;
    }
    if (self->_allowedOnHomeScreen)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_56;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x20) == 0) {
      goto LABEL_56;
    }
    if (self->_allowedOnSpotlight)
    {
      if (!*((unsigned char *)v4 + 66)) {
        goto LABEL_56;
      }
    }
    else if (*((unsigned char *)v4 + 66))
    {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x40) != 0)
    {
      if (self->_shouldClearOnEngagement)
      {
        if (!*((unsigned char *)v4 + 67)) {
          goto LABEL_56;
        }
        goto LABEL_42;
      }
      if (!*((unsigned char *)v4 + 67)) {
        goto LABEL_42;
      }
    }
LABEL_56:
    BOOL v9 = 0;
    goto LABEL_57;
  }
  if ((*((unsigned char *)v4 + 68) & 0x40) != 0) {
    goto LABEL_56;
  }
LABEL_42:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_predictionReasons != *((void *)v4 + 3)) {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_contextStartDate != *((double *)v4 + 2)) {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_56;
  }
  BOOL v9 = (*((unsigned char *)v4 + 68) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_contextEndDate != *((double *)v4 + 1)) {
      goto LABEL_56;
    }
    BOOL v9 = 1;
  }
LABEL_57:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v23 = [(NSString *)self->_title hash];
  NSUInteger v22 = [(NSString *)self->_subtitle hash];
  NSUInteger v21 = [(NSString *)self->_reason hash];
  uint64_t v3 = [(NSMutableArray *)self->_preferredLayoutConfigs hash];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v5 = 2654435761 * self->_allowedOnLockscreen;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_allowedOnHomeScreen;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_allowedOnSpotlight;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_shouldClearOnEngagement;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    unint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  unint64_t v9 = 2654435761u * self->_predictionReasons;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  double contextStartDate = self->_contextStartDate;
  double v11 = -contextStartDate;
  if (contextStartDate >= 0.0) {
    double v11 = self->_contextStartDate;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if (has)
  {
    double contextEndDate = self->_contextEndDate;
    double v17 = -contextEndDate;
    if (contextEndDate >= 0.0) {
      double v17 = self->_contextEndDate;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v22 ^ v23 ^ v21 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_23;
  }
  uint64_t v5 = (void *)v3[7];
  if (v5) {
    objc_storeStrong((id *)(a1 + 56), v5);
  }
  uint64_t v6 = (void *)*((void *)v4 + 6);
  if (v6) {
    objc_storeStrong((id *)(a1 + 48), v6);
  }
  uint64_t v7 = (void *)*((void *)v4 + 5);
  if (v7) {
    objc_storeStrong((id *)(a1 + 40), v7);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *((id *)v4 + 4);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[ATXPBProactiveSuggestionUISpecification addPreferredLayoutConfigs:](a1, *(void **)(*((void *)&v14 + 1) + 8 * i));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  char v13 = *((unsigned char *)v4 + 68);
  if ((v13 & 0x10) != 0)
  {
    *(unsigned char *)(a1 + 65) = *((unsigned char *)v4 + 65);
    *(unsigned char *)(a1 + 68) |= 0x10u;
    char v13 = *((unsigned char *)v4 + 68);
    if ((v13 & 8) == 0)
    {
LABEL_17:
      if ((v13 & 0x20) == 0) {
        goto LABEL_18;
      }
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) == 0)
  {
    goto LABEL_17;
  }
  *(unsigned char *)(a1 + 64) = *((unsigned char *)v4 + 64);
  *(unsigned char *)(a1 + 68) |= 8u;
  char v13 = *((unsigned char *)v4 + 68);
  if ((v13 & 0x20) == 0)
  {
LABEL_18:
    if ((v13 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(unsigned char *)(a1 + 66) = *((unsigned char *)v4 + 66);
  *(unsigned char *)(a1 + 68) |= 0x20u;
  char v13 = *((unsigned char *)v4 + 68);
  if ((v13 & 0x40) == 0)
  {
LABEL_19:
    if ((v13 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(unsigned char *)(a1 + 67) = *((unsigned char *)v4 + 67);
  *(unsigned char *)(a1 + 68) |= 0x40u;
  char v13 = *((unsigned char *)v4 + 68);
  if ((v13 & 4) == 0)
  {
LABEL_20:
    if ((v13 & 2) == 0) {
      goto LABEL_21;
    }
LABEL_29:
    *(void *)(a1 + 16) = *((void *)v4 + 2);
    *(unsigned char *)(a1 + 68) |= 2u;
    if ((*((unsigned char *)v4 + 68) & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_28:
  *(void *)(a1 + 24) = *((void *)v4 + 3);
  *(unsigned char *)(a1 + 68) |= 4u;
  char v13 = *((unsigned char *)v4 + 68);
  if ((v13 & 2) != 0) {
    goto LABEL_29;
  }
LABEL_21:
  if (v13)
  {
LABEL_22:
    *(void *)(a1 + 8) = *((void *)v4 + 1);
    *(unsigned char *)(a1 + 68) |= 1u;
  }
LABEL_23:
}

- (void)setPreferredLayoutConfigs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (double)contextStartDate
{
  if (a1) {
    return *(double *)(a1 + 16);
  }
  else {
    return 0.0;
  }
}

- (double)contextEndDate
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

@end