@interface TRANSITPbLocationFingerprintV1
- (BOOL)hasLatitude;
- (BOOL)hasLocationId;
- (BOOL)hasLongitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)macModes;
- (NSString)locationId;
- (double)latitude;
- (double)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)macModesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)macModesCount;
- (void)addMacModes:(id)a3;
- (void)clearMacModes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationId:(id)a3;
- (void)setLongitude:(double)a3;
- (void)setMacModes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbLocationFingerprintV1

- (void)dealloc
{
  [(TRANSITPbLocationFingerprintV1 *)self setLocationId:0];
  [(TRANSITPbLocationFingerprintV1 *)self setMacModes:0];
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbLocationFingerprintV1;
  [(TRANSITPbLocationFingerprintV1 *)&v3 dealloc];
}

- (BOOL)hasLocationId
{
  return self->_locationId != 0;
}

- (void)setLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearMacModes
{
}

- (void)addMacModes:(id)a3
{
  macModes = self->_macModes;
  if (!macModes)
  {
    macModes = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_macModes = macModes;
  }

  [(NSMutableArray *)macModes addObject:a3];
}

- (unint64_t)macModesCount
{
  return (unint64_t)[(NSMutableArray *)self->_macModes count];
}

- (id)macModesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_macModes objectAtIndex:a3];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbLocationFingerprintV1;
  return +[NSString stringWithFormat:@"%@ %@", [(TRANSITPbLocationFingerprintV1 *)&v3 description], [(TRANSITPbLocationFingerprintV1 *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  locationId = self->_locationId;
  if (locationId) {
    [v3 setObject:locationId forKey:@"locationId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v4 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude)] forKey:@"latitude"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v4 setObject:[NSNumber numberWithDouble:self->_longitude] forKey:@"longitude"];
  }
  if ([(NSMutableArray *)self->_macModes count])
  {
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_macModes, "count")];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    macModes = self->_macModes;
    id v9 = [(NSMutableArray *)macModes countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(macModes);
          }
          [v7 addObject:[*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation]];
        }
        id v10 = [(NSMutableArray *)macModes countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    [v4 setObject:v7 forKey:@"macModes"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10100D8CC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_locationId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  macModes = self->_macModes;
  v6 = (char *)[(NSMutableArray *)macModes countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(macModes);
        }
        PBDataWriterWriteSubmessage();
      }
      id v7 = (char *)[(NSMutableArray *)macModes countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_locationId) {
    [a3 setLocationId:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = *(void *)&self->_latitude;
    *((unsigned char *)a3 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = *(void *)&self->_longitude;
    *((unsigned char *)a3 + 40) |= 2u;
  }
  if ([(TRANSITPbLocationFingerprintV1 *)self macModesCount])
  {
    [a3 clearMacModes];
    unint64_t v6 = [(TRANSITPbLocationFingerprintV1 *)self macModesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addMacModes:-[TRANSITPbLocationFingerprintV1 macModesAtIndex:](self, "macModesAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[3] = [(NSString *)self->_locationId copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = *(id *)&self->_latitude;
    *((unsigned char *)v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[2] = *(id *)&self->_longitude;
    *((unsigned char *)v5 + 40) |= 2u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  macModes = self->_macModes;
  id v8 = [(NSMutableArray *)macModes countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(macModes);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) copyWithZone:a3];
        [v5 addMacModes:v12];
      }
      id v9 = [(NSMutableArray *)macModes countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    locationId = self->_locationId;
    if (!((unint64_t)locationId | *((void *)a3 + 3))
      || (unsigned int v5 = -[NSString isEqual:](locationId, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_latitude != *((double *)a3 + 1)) {
          goto LABEL_16;
        }
      }
      else if (*((unsigned char *)a3 + 40))
      {
LABEL_16:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_longitude != *((double *)a3 + 2)) {
          goto LABEL_16;
        }
      }
      else if ((*((unsigned char *)a3 + 40) & 2) != 0)
      {
        goto LABEL_16;
      }
      macModes = self->_macModes;
      if ((unint64_t)macModes | *((void *)a3 + 4))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](macModes, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_locationId hash];
  char has = (char)self->_has;
  if (has)
  {
    double latitude = self->_latitude;
    double v7 = -latitude;
    if (latitude >= 0.0) {
      double v7 = self->_latitude;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    double longitude = self->_longitude;
    double v12 = -longitude;
    if (longitude >= 0.0) {
      double v12 = self->_longitude;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v5 ^ v3 ^ v10 ^ (unint64_t)[(NSMutableArray *)self->_macModes hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[TRANSITPbLocationFingerprintV1 setLocationId:](self, "setLocationId:");
  }
  char v5 = *((unsigned char *)a3 + 40);
  if (v5)
  {
    self->_double latitude = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_double longitude = *((double *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = (void *)*((void *)a3 + 4);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TRANSITPbLocationFingerprintV1 *)self addMacModes:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (NSMutableArray)macModes
{
  return self->_macModes;
}

- (void)setMacModes:(id)a3
{
}

@end