@interface TRANSITPbRegionPreloadMarket
- (BOOL)hasNorthWestLatitude;
- (BOOL)hasNorthWestLongitude;
- (BOOL)hasSouthEastLatitude;
- (BOOL)hasSouthEastLongitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tiles;
- (double)northWestLatitude;
- (double)northWestLongitude;
- (double)southEastLatitude;
- (double)southEastLongitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tilesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tilesCount;
- (void)addTiles:(id)a3;
- (void)clearTiles;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasNorthWestLatitude:(BOOL)a3;
- (void)setHasNorthWestLongitude:(BOOL)a3;
- (void)setHasSouthEastLatitude:(BOOL)a3;
- (void)setHasSouthEastLongitude:(BOOL)a3;
- (void)setNorthWestLatitude:(double)a3;
- (void)setNorthWestLongitude:(double)a3;
- (void)setSouthEastLatitude:(double)a3;
- (void)setSouthEastLongitude:(double)a3;
- (void)setTiles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbRegionPreloadMarket

- (void)dealloc
{
  [(TRANSITPbRegionPreloadMarket *)self setTiles:0];
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbRegionPreloadMarket;
  [(TRANSITPbRegionPreloadMarket *)&v3 dealloc];
}

- (void)setNorthWestLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_northWestLatitude = a3;
}

- (void)setHasNorthWestLatitude:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNorthWestLatitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNorthWestLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_northWestLongitude = a3;
}

- (void)setHasNorthWestLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNorthWestLongitude
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSouthEastLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_southEastLatitude = a3;
}

- (void)setHasSouthEastLatitude:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSouthEastLatitude
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSouthEastLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_southEastLongitude = a3;
}

- (void)setHasSouthEastLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSouthEastLongitude
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearTiles
{
}

- (void)addTiles:(id)a3
{
  tiles = self->_tiles;
  if (!tiles)
  {
    tiles = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_tiles = tiles;
  }

  [(NSMutableArray *)tiles addObject:a3];
}

- (unint64_t)tilesCount
{
  return (unint64_t)[(NSMutableArray *)self->_tiles count];
}

- (id)tilesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_tiles objectAtIndex:a3];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbRegionPreloadMarket;
  return +[NSString stringWithFormat:@"%@ %@", [(TRANSITPbRegionPreloadMarket *)&v3 description], [(TRANSITPbRegionPreloadMarket *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_northWestLatitude)] forKey:@"northWestLatitude"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_northWestLongitude)] forKey:@"northWestLongitude"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithDouble:self->_southEastLatitude] forKey:@"southEastLatitude"];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithDouble:self->_southEastLongitude] forKey:@"southEastLongitude"];
LABEL_6:
  if ([(NSMutableArray *)self->_tiles count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_tiles, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    tiles = self->_tiles;
    id v7 = [(NSMutableArray *)tiles countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(tiles);
          }
          [v5 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        id v8 = [(NSMutableArray *)tiles countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"tiles"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1008805FC(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  tiles = self->_tiles;
  v6 = (char *)[(NSMutableArray *)tiles countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(tiles);
        }
        PBDataWriterWriteSubmessage();
      }
      id v7 = (char *)[(NSMutableArray *)tiles countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = *(void *)&self->_northWestLatitude;
    *((unsigned char *)a3 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_13:
      *((void *)a3 + 3) = *(void *)&self->_southEastLatitude;
      *((unsigned char *)a3 + 48) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = *(void *)&self->_northWestLongitude;
  *((unsigned char *)a3 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((void *)a3 + 4) = *(void *)&self->_southEastLongitude;
    *((unsigned char *)a3 + 48) |= 8u;
  }
LABEL_6:
  if ([(TRANSITPbRegionPreloadMarket *)self tilesCount])
  {
    [a3 clearTiles];
    unint64_t v6 = [(TRANSITPbRegionPreloadMarket *)self tilesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addTiles:-[TRANSITPbRegionPreloadMarket tilesAtIndex:](self, "tilesAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v5 + 1) = *(void *)&self->_northWestLatitude;
    *((unsigned char *)v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 2) = *(void *)&self->_northWestLongitude;
  *((unsigned char *)v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  *((void *)v5 + 3) = *(void *)&self->_southEastLatitude;
  *((unsigned char *)v5 + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((void *)v5 + 4) = *(void *)&self->_southEastLongitude;
    *((unsigned char *)v5 + 48) |= 8u;
  }
LABEL_6:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  tiles = self->_tiles;
  id v9 = [(NSMutableArray *)tiles countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(tiles);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addTiles:v13];
      }
      id v10 = [(NSMutableArray *)tiles countByEnumeratingWithState:&v15 objects:v19 count:16];
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
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_northWestLatitude != *((double *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_northWestLongitude != *((double *)a3 + 2)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
      goto LABEL_24;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_southEastLatitude != *((double *)a3 + 3)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 4) != 0)
    {
      goto LABEL_24;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_southEastLongitude != *((double *)a3 + 4)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
      goto LABEL_24;
    }
    tiles = self->_tiles;
    if ((unint64_t)tiles | *((void *)a3 + 5))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](tiles, "isEqual:");
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
  if (has)
  {
    double northWestLatitude = self->_northWestLatitude;
    double v6 = -northWestLatitude;
    if (northWestLatitude >= 0.0) {
      double v6 = self->_northWestLatitude;
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
  if ((has & 2) != 0)
  {
    double northWestLongitude = self->_northWestLongitude;
    double v11 = -northWestLongitude;
    if (northWestLongitude >= 0.0) {
      double v11 = self->_northWestLongitude;
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
  if ((has & 4) != 0)
  {
    double southEastLatitude = self->_southEastLatitude;
    double v16 = -southEastLatitude;
    if (southEastLatitude >= 0.0) {
      double v16 = self->_southEastLatitude;
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
  if ((has & 8) != 0)
  {
    double southEastLongitude = self->_southEastLongitude;
    double v21 = -southEastLongitude;
    if (southEastLongitude >= 0.0) {
      double v21 = self->_southEastLongitude;
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
  return v9 ^ v4 ^ v14 ^ v19 ^ (unint64_t)[(NSMutableArray *)self->_tiles hash];
}

- (void)mergeFrom:(id)a3
{
  char v4 = *((unsigned char *)a3 + 48);
  if (v4)
  {
    self->_double northWestLatitude = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v4 = *((unsigned char *)a3 + 48);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_double northWestLongitude = *((double *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v4 = *((unsigned char *)a3 + 48);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  self->_double southEastLatitude = *((double *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 48) & 8) != 0)
  {
LABEL_5:
    self->_double southEastLongitude = *((double *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unsigned int v5 = (void *)*((void *)a3 + 5);
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
        [(TRANSITPbRegionPreloadMarket *)self addTiles:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (double)northWestLatitude
{
  return self->_northWestLatitude;
}

- (double)northWestLongitude
{
  return self->_northWestLongitude;
}

- (double)southEastLatitude
{
  return self->_southEastLatitude;
}

- (double)southEastLongitude
{
  return self->_southEastLongitude;
}

- (NSMutableArray)tiles
{
  return self->_tiles;
}

- (void)setTiles:(id)a3
{
}

@end