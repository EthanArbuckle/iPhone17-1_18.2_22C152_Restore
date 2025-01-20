@interface TRANSITPbRegionPreloadManifest
- (BOOL)hasExpirationAgeSecs;
- (BOOL)hasGenerationTimeSecs;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)markets;
- (double)generationTimeSecs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)marketsAtIndex:(unint64_t)a3;
- (int)expirationAgeSecs;
- (int)version;
- (unint64_t)hash;
- (unint64_t)marketsCount;
- (void)addMarkets:(id)a3;
- (void)clearMarkets;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setExpirationAgeSecs:(int)a3;
- (void)setGenerationTimeSecs:(double)a3;
- (void)setHasExpirationAgeSecs:(BOOL)a3;
- (void)setHasGenerationTimeSecs:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMarkets:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbRegionPreloadManifest

- (void)dealloc
{
  [(TRANSITPbRegionPreloadManifest *)self setMarkets:0];
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbRegionPreloadManifest;
  [(TRANSITPbRegionPreloadManifest *)&v3 dealloc];
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setGenerationTimeSecs:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_generationTimeSecs = a3;
}

- (void)setHasGenerationTimeSecs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGenerationTimeSecs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExpirationAgeSecs:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_expirationAgeSecs = a3;
}

- (void)setHasExpirationAgeSecs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpirationAgeSecs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearMarkets
{
}

- (void)addMarkets:(id)a3
{
  markets = self->_markets;
  if (!markets)
  {
    markets = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_markets = markets;
  }

  [(NSMutableArray *)markets addObject:a3];
}

- (unint64_t)marketsCount
{
  return (unint64_t)[(NSMutableArray *)self->_markets count];
}

- (id)marketsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_markets objectAtIndex:a3];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbRegionPreloadManifest;
  return +[NSString stringWithFormat:@"%@ %@", [(TRANSITPbRegionPreloadManifest *)&v3 description], [(TRANSITPbRegionPreloadManifest *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_version)] forKey:@"version"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_generationTimeSecs)] forKey:@"generationTimeSecs"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_expirationAgeSecs)] forKey:@"expirationAgeSecs"];
LABEL_5:
  if ([(NSMutableArray *)self->_markets count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_markets, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    markets = self->_markets;
    id v7 = [(NSMutableArray *)markets countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(markets);
          }
          [v5 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        id v8 = [(NSMutableArray *)markets countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"markets"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100777BD4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  markets = self->_markets;
  v6 = (char *)[(NSMutableArray *)markets countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(markets);
        }
        PBDataWriterWriteSubmessage();
      }
      id v7 = (char *)[(NSMutableArray *)markets countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_11:
    *((void *)a3 + 1) = *(void *)&self->_generationTimeSecs;
    *((unsigned char *)a3 + 36) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)a3 + 8) = self->_version;
  *((unsigned char *)a3 + 36) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 4) = self->_expirationAgeSecs;
    *((unsigned char *)a3 + 36) |= 2u;
  }
LABEL_5:
  if ([(TRANSITPbRegionPreloadManifest *)self marketsCount])
  {
    [a3 clearMarkets];
    unint64_t v6 = [(TRANSITPbRegionPreloadManifest *)self marketsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addMarkets:-[TRANSITPbRegionPreloadManifest marketsAtIndex:](self, "marketsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_version;
    *((unsigned char *)v5 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 1) = *(void *)&self->_generationTimeSecs;
  *((unsigned char *)v5 + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 4) = self->_expirationAgeSecs;
    *((unsigned char *)v5 + 36) |= 2u;
  }
LABEL_5:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  markets = self->_markets;
  id v9 = [(NSMutableArray *)markets countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(markets);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addMarkets:v13];
      }
      id v10 = [(NSMutableArray *)markets countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_version != *((_DWORD *)a3 + 8)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_generationTimeSecs != *((double *)a3 + 1)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
      goto LABEL_19;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_expirationAgeSecs != *((_DWORD *)a3 + 4)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 2) != 0)
    {
      goto LABEL_19;
    }
    markets = self->_markets;
    if ((unint64_t)markets | *((void *)a3 + 3))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](markets, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double generationTimeSecs = self->_generationTimeSecs;
  double v6 = -generationTimeSecs;
  if (generationTimeSecs >= 0.0) {
    double v6 = self->_generationTimeSecs;
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
  if ((has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_expirationAgeSecs;
  }
  else {
    uint64_t v10 = 0;
  }
  return v9 ^ v4 ^ v10 ^ (unint64_t)[(NSMutableArray *)self->_markets hash];
}

- (void)mergeFrom:(id)a3
{
  char v4 = *((unsigned char *)a3 + 36);
  if ((v4 & 4) != 0)
  {
    self->_version = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v4 = *((unsigned char *)a3 + 36);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double generationTimeSecs = *((double *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 36) & 2) != 0)
  {
LABEL_4:
    self->_expirationAgeSecs = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unsigned int v5 = (void *)*((void *)a3 + 3);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(TRANSITPbRegionPreloadManifest *)self addMarkets:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int)version
{
  return self->_version;
}

- (double)generationTimeSecs
{
  return self->_generationTimeSecs;
}

- (int)expirationAgeSecs
{
  return self->_expirationAgeSecs;
}

- (NSMutableArray)markets
{
  return self->_markets;
}

- (void)setMarkets:(id)a3
{
}

@end