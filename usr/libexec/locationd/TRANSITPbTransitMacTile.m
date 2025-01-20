@interface TRANSITPbTransitMacTile
+ (Class)macsType;
- (BOOL)hasExpirationAgeSecs;
- (BOOL)hasGenerationTimeSecs;
- (BOOL)hasTileX;
- (BOOL)hasTileY;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)macs;
- (double)generationTimeSecs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)macsAtIndex:(unint64_t)a3;
- (int)expirationAgeSecs;
- (int)tileX;
- (int)tileY;
- (int)version;
- (unint64_t)hash;
- (unint64_t)macsCount;
- (void)addMacs:(id)a3;
- (void)clearMacs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setExpirationAgeSecs:(int)a3;
- (void)setGenerationTimeSecs:(double)a3;
- (void)setHasExpirationAgeSecs:(BOOL)a3;
- (void)setHasGenerationTimeSecs:(BOOL)a3;
- (void)setHasTileX:(BOOL)a3;
- (void)setHasTileY:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMacs:(id)a3;
- (void)setTileX:(int)a3;
- (void)setTileY:(int)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbTransitMacTile

- (void)dealloc
{
  [(TRANSITPbTransitMacTile *)self setMacs:0];
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbTransitMacTile;
  [(TRANSITPbTransitMacTile *)&v3 dealloc];
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTileX:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tileX = a3;
}

- (void)setHasTileX:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTileX
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTileY:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_tileY = a3;
}

- (void)setHasTileY:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTileY
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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

- (void)clearMacs
{
}

- (void)addMacs:(id)a3
{
  macs = self->_macs;
  if (!macs)
  {
    macs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_macs = macs;
  }

  [(NSMutableArray *)macs addObject:a3];
}

- (unint64_t)macsCount
{
  return (unint64_t)[(NSMutableArray *)self->_macs count];
}

- (id)macsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_macs objectAtIndex:a3];
}

+ (Class)macsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbTransitMacTile;
  return +[NSString stringWithFormat:@"%@ %@", [(TRANSITPbTransitMacTile *)&v3 description], [(TRANSITPbTransitMacTile *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_version)] forKey:@"version"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tileX)] forKey:@"tileX"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tileY)] forKey:@"tileY"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_20:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_generationTimeSecs)] forKey:@"generationTimeSecs"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_expirationAgeSecs)] forKey:@"expirationAgeSecs"];
LABEL_7:
  if ([(NSMutableArray *)self->_macs count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_macs, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    macs = self->_macs;
    id v7 = [(NSMutableArray *)macs countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(macs);
          }
          [v5 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        id v8 = [(NSMutableArray *)macs countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"macs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1008C2BC4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  macs = self->_macs;
  v6 = (char *)[(NSMutableArray *)macs countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(macs);
        }
        PBDataWriterWriteSubmessage();
      }
      id v7 = (char *)[(NSMutableArray *)macs countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_version;
    *((unsigned char *)a3 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_tileX;
  *((unsigned char *)a3 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_15:
    *((void *)a3 + 1) = *(void *)&self->_generationTimeSecs;
    *((unsigned char *)a3 + 44) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  *((_DWORD *)a3 + 9) = self->_tileY;
  *((unsigned char *)a3 + 44) |= 8u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_15;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 4) = self->_expirationAgeSecs;
    *((unsigned char *)a3 + 44) |= 2u;
  }
LABEL_7:
  if ([(TRANSITPbTransitMacTile *)self macsCount])
  {
    [a3 clearMacs];
    unint64_t v6 = [(TRANSITPbTransitMacTile *)self macsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addMacs:-[TRANSITPbTransitMacTile macsAtIndex:](self, "macsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_version;
    *((unsigned char *)v5 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 8) = self->_tileX;
  *((unsigned char *)v5 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 9) = self->_tileY;
  *((unsigned char *)v5 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_18:
  *((void *)v5 + 1) = *(void *)&self->_generationTimeSecs;
  *((unsigned char *)v5 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 4) = self->_expirationAgeSecs;
    *((unsigned char *)v5 + 44) |= 2u;
  }
LABEL_7:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  macs = self->_macs;
  id v9 = [(NSMutableArray *)macs countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(macs);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addMacs:v13];
      }
      id v10 = [(NSMutableArray *)macs countByEnumeratingWithState:&v15 objects:v19 count:16];
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
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_version != *((_DWORD *)a3 + 10)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x10) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_tileX != *((_DWORD *)a3 + 8)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 4) != 0)
    {
      goto LABEL_29;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_tileY != *((_DWORD *)a3 + 9)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 8) != 0)
    {
      goto LABEL_29;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_generationTimeSecs != *((double *)a3 + 1)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
      goto LABEL_29;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_expirationAgeSecs != *((_DWORD *)a3 + 4)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 2) != 0)
    {
      goto LABEL_29;
    }
    macs = self->_macs;
    if ((unint64_t)macs | *((void *)a3 + 3))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](macs, "isEqual:");
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
  if ((has & 0x10) != 0)
  {
    uint64_t v4 = 2654435761 * self->_version;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_tileX;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_tileY;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double generationTimeSecs = self->_generationTimeSecs;
  double v8 = -generationTimeSecs;
  if (generationTimeSecs >= 0.0) {
    double v8 = self->_generationTimeSecs;
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
LABEL_15:
  if ((has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_expirationAgeSecs;
  }
  else {
    uint64_t v12 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ (unint64_t)[(NSMutableArray *)self->_macs hash];
}

- (void)mergeFrom:(id)a3
{
  char v4 = *((unsigned char *)a3 + 44);
  if ((v4 & 0x10) != 0)
  {
    self->_version = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
    char v4 = *((unsigned char *)a3 + 44);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_tileX = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 4u;
  char v4 = *((unsigned char *)a3 + 44);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_tileY = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 8u;
  char v4 = *((unsigned char *)a3 + 44);
  if ((v4 & 1) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_18:
  self->_double generationTimeSecs = *((double *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 44) & 2) != 0)
  {
LABEL_6:
    self->_expirationAgeSecs = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 3);
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
        [(TRANSITPbTransitMacTile *)self addMacs:*(void *)(*((void *)&v10 + 1) + 8 * i)];
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

- (int)tileX
{
  return self->_tileX;
}

- (int)tileY
{
  return self->_tileY;
}

- (double)generationTimeSecs
{
  return self->_generationTimeSecs;
}

- (int)expirationAgeSecs
{
  return self->_expirationAgeSecs;
}

- (NSMutableArray)macs
{
  return self->_macs;
}

- (void)setMacs:(id)a3
{
}

@end