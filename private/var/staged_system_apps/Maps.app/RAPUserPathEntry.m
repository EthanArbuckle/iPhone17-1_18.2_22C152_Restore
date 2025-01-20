@interface RAPUserPathEntry
- (BOOL)hasRerouteLocation;
- (BOOL)hasRouteIndex;
- (BOOL)hasStepIndex;
- (BOOL)hasTraversal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)rerouteLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)traversalAsString:(int)a3;
- (int)StringAsTraversal:(id)a3;
- (int)traversal;
- (unint64_t)hash;
- (unsigned)routeIndex;
- (unsigned)stepIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRouteIndex:(BOOL)a3;
- (void)setHasStepIndex:(BOOL)a3;
- (void)setHasTraversal:(BOOL)a3;
- (void)setRerouteLocation:(id)a3;
- (void)setRouteIndex:(unsigned int)a3;
- (void)setStepIndex:(unsigned int)a3;
- (void)setTraversal:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RAPUserPathEntry

- (void)setRouteIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_routeIndex = a3;
}

- (void)setHasRouteIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRouteIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStepIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_stepIndex = a3;
}

- (void)setHasStepIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStepIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)traversal
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_traversal;
  }
  else {
    return 0;
  }
}

- (void)setTraversal:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_traversal = a3;
}

- (void)setHasTraversal:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTraversal
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)traversalAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_10131A258 + a3);
  }

  return v3;
}

- (int)StringAsTraversal:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STORED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MISSED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasRerouteLocation
{
  return self->_rerouteLocation != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RAPUserPathEntry;
  id v3 = [(RAPUserPathEntry *)&v7 description];
  int v4 = [(RAPUserPathEntry *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_routeIndex];
    [v3 setObject:v5 forKey:@"routeIndex"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v6 = +[NSNumber numberWithUnsignedInt:self->_stepIndex];
  [v3 setObject:v6 forKey:@"stepIndex"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t traversal = self->_traversal;
  if (traversal >= 3)
  {
    v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_traversal];
  }
  else
  {
    v8 = *(&off_10131A258 + traversal);
  }
  [v3 setObject:v8 forKey:@"traversal"];

LABEL_11:
  rerouteLocation = self->_rerouteLocation;
  if (rerouteLocation)
  {
    v10 = [(GEOLatLng *)rerouteLocation dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"rerouteLocation"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B96908((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_rerouteLocation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_routeIndex;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_stepIndex;
  *((unsigned char *)v4 + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[6] = self->_traversal;
    *((unsigned char *)v4 + 28) |= 4u;
  }
LABEL_5:
  if (self->_rerouteLocation)
  {
    id v6 = v4;
    [v4 setRerouteLocation:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 5) = self->_stepIndex;
    *((unsigned char *)v5 + 28) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 4) = self->_routeIndex;
  *((unsigned char *)v5 + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 6) = self->_traversal;
    *((unsigned char *)v5 + 28) |= 4u;
  }
LABEL_5:
  id v8 = [(GEOLatLng *)self->_rerouteLocation copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_routeIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_19:
    unsigned __int8 v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_stepIndex != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_traversal != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  rerouteLocation = self->_rerouteLocation;
  if ((unint64_t)rerouteLocation | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[GEOLatLng isEqual:](rerouteLocation, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ (unint64_t)[(GEOLatLng *)self->_rerouteLocation hash];
  }
  uint64_t v2 = 2654435761 * self->_routeIndex;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_stepIndex;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_traversal;
  return v3 ^ v2 ^ v4 ^ (unint64_t)[(GEOLatLng *)self->_rerouteLocation hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 28);
  if (v6)
  {
    self->_routeIndex = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 28);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_stepIndex = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_4:
    self->_uint64_t traversal = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  rerouteLocation = self->_rerouteLocation;
  uint64_t v8 = v5[1];
  if (rerouteLocation)
  {
    if (!v8) {
      goto LABEL_14;
    }
    v9 = v5;
    -[GEOLatLng mergeFrom:](rerouteLocation, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    v9 = v5;
    [(RAPUserPathEntry *)self setRerouteLocation:"setRerouteLocation:"];
  }
  v5 = v9;
LABEL_14:
}

- (unsigned)routeIndex
{
  return self->_routeIndex;
}

- (unsigned)stepIndex
{
  return self->_stepIndex;
}

- (GEOLatLng)rerouteLocation
{
  return self->_rerouteLocation;
}

- (void)setRerouteLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end