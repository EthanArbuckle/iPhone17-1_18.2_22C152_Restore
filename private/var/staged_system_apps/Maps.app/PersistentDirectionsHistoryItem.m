@interface PersistentDirectionsHistoryItem
- (BOOL)hasDirectionsResponseID;
- (BOOL)hasEndSearchResult;
- (BOOL)hasPosition;
- (BOOL)hasReportAProblemAttachment;
- (BOOL)hasStartSearchResult;
- (BOOL)hasSyncIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)hasTransportType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)directionsResponseID;
- (NSString)reportAProblemAttachment;
- (NSString)syncIdentifier;
- (SearchResult)endSearchResult;
- (SearchResult)startSearchResult;
- (double)position;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)transportTypeAsString:(int)a3;
- (int)StringAsTransportType:(id)a3;
- (int)transportType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDirectionsResponseID:(id)a3;
- (void)setEndSearchResult:(id)a3;
- (void)setHasPosition:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setPosition:(double)a3;
- (void)setReportAProblemAttachment:(id)a3;
- (void)setStartSearchResult:(id)a3;
- (void)setSyncIdentifier:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTransportType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PersistentDirectionsHistoryItem

- (BOOL)hasStartSearchResult
{
  return self->_startSearchResult != 0;
}

- (BOOL)hasEndSearchResult
{
  return self->_endSearchResult != 0;
}

- (BOOL)hasDirectionsResponseID
{
  return self->_directionsResponseID != 0;
}

- (BOOL)hasReportAProblemAttachment
{
  return self->_reportAProblemAttachment != 0;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setPosition:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPosition
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTransportType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTransportType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_10131A388 + a3);
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PersistentDirectionsHistoryItem;
  char v3 = [(PersistentDirectionsHistoryItem *)&v7 description];
  int v4 = [(PersistentDirectionsHistoryItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  startSearchResult = self->_startSearchResult;
  if (startSearchResult)
  {
    v5 = [(SearchResultRepr *)startSearchResult dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"startSearchResult"];
  }
  endSearchResult = self->_endSearchResult;
  if (endSearchResult)
  {
    objc_super v7 = [(SearchResultRepr *)endSearchResult dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"endSearchResult"];
  }
  directionsResponseID = self->_directionsResponseID;
  if (directionsResponseID) {
    [v3 setObject:directionsResponseID forKey:@"directionsResponseID"];
  }
  reportAProblemAttachment = self->_reportAProblemAttachment;
  if (reportAProblemAttachment) {
    [v3 setObject:reportAProblemAttachment forKey:@"reportAProblemAttachment"];
  }
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier) {
    [v3 setObject:syncIdentifier forKey:@"syncIdentifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v14 = +[NSNumber numberWithDouble:self->_position];
    [v3 setObject:v14 forKey:@"position"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  uint64_t transportType = self->_transportType;
  if (transportType >= 7)
  {
    v16 = +[NSString stringWithFormat:@"(unknown: %i)", self->_transportType];
  }
  else
  {
    v16 = *(&off_10131A388 + transportType);
  }
  [v3 setObject:v16 forKey:@"transportType"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_14:
  v12 = +[NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v12 forKey:@"timestamp"];

LABEL_15:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B9F0CC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_startSearchResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_endSearchResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_directionsResponseID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_reportAProblemAttachment)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_syncIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_15:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_startSearchResult)
  {
    [v4 setStartSearchResult:];
    id v4 = v6;
  }
  if (self->_endSearchResult)
  {
    [v6 setEndSearchResult:];
    id v4 = v6;
  }
  if (self->_directionsResponseID)
  {
    [v6 setDirectionsResponseID:];
    id v4 = v6;
  }
  if (self->_reportAProblemAttachment)
  {
    [v6 setReportAProblemAttachment:];
    id v4 = v6;
  }
  if (self->_syncIdentifier)
  {
    [v6 setSyncIdentifier:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_position;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 16) = self->_transportType;
  *((unsigned char *)v4 + 68) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    *((void *)v4 + 2) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 68) |= 2u;
  }
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [self->_startSearchResult copyWithZone:a3];
  objc_super v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = [self->_endSearchResult copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSData *)self->_directionsResponseID copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(NSString *)self->_reportAProblemAttachment copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  id v14 = [(NSString *)self->_syncIdentifier copyWithZone:a3];
  v15 = (void *)v5[7];
  v5[7] = v14;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 16) = self->_transportType;
    *((unsigned char *)v5 + 68) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v5;
    }
    goto LABEL_4;
  }
  v5[1] = *(void *)&self->_position;
  *((unsigned char *)v5 + 68) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5[2] = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 68) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  startSearchResult = self->_startSearchResult;
  if ((unint64_t)startSearchResult | *((void *)v4 + 6))
  {
    if (!-[SearchResult isEqual:](startSearchResult, "isEqual:")) {
      goto LABEL_26;
    }
  }
  endSearchResult = self->_endSearchResult;
  if ((unint64_t)endSearchResult | *((void *)v4 + 4))
  {
    if (!-[SearchResult isEqual:](endSearchResult, "isEqual:")) {
      goto LABEL_26;
    }
  }
  directionsResponseID = self->_directionsResponseID;
  if ((unint64_t)directionsResponseID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](directionsResponseID, "isEqual:")) {
      goto LABEL_26;
    }
  }
  reportAProblemAttachment = self->_reportAProblemAttachment;
  if ((unint64_t)reportAProblemAttachment | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](reportAProblemAttachment, "isEqual:")) {
      goto LABEL_26;
    }
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](syncIdentifier, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_position != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_26:
    BOOL v10 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_transportType != *((_DWORD *)v4 + 16)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_26;
  }
  BOOL v10 = (*((unsigned char *)v4 + 68) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_timestamp != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
    BOOL v10 = 1;
  }
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [self->_startSearchResult hash];
  unint64_t v4 = [self->_endSearchResult hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_directionsResponseID hash];
  NSUInteger v6 = [(NSString *)self->_reportAProblemAttachment hash];
  NSUInteger v7 = [(NSString *)self->_syncIdentifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double position = self->_position;
    double v11 = -position;
    if (position >= 0.0) {
      double v11 = self->_position;
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
    uint64_t v14 = 2654435761 * self->_transportType;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14 ^ v19;
  }
  uint64_t v14 = 0;
  if ((has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double timestamp = self->_timestamp;
  double v16 = -timestamp;
  if (timestamp >= 0.0) {
    double v16 = self->_timestamp;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  startSearchResult = self->_startSearchResult;
  uint64_t v6 = *((void *)v4 + 6);
  id v10 = v4;
  if (startSearchResult)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SearchResultRepr mergeFrom:](startSearchResult, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PersistentDirectionsHistoryItem setStartSearchResult:](self, "setStartSearchResult:");
  }
  id v4 = v10;
LABEL_7:
  endSearchResult = self->_endSearchResult;
  uint64_t v8 = *((void *)v4 + 4);
  if (endSearchResult)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SearchResultRepr mergeFrom:](endSearchResult, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PersistentDirectionsHistoryItem setEndSearchResult:](self, "setEndSearchResult:");
  }
  id v4 = v10;
LABEL_13:
  if (*((void *)v4 + 3))
  {
    -[PersistentDirectionsHistoryItem setDirectionsResponseID:](self, "setDirectionsResponseID:");
    id v4 = v10;
  }
  if (*((void *)v4 + 5))
  {
    -[PersistentDirectionsHistoryItem setReportAProblemAttachment:](self, "setReportAProblemAttachment:");
    id v4 = v10;
  }
  if (*((void *)v4 + 7))
  {
    -[PersistentDirectionsHistoryItem setSyncIdentifier:](self, "setSyncIdentifier:");
    id v4 = v10;
  }
  char v9 = *((unsigned char *)v4 + 68);
  if (v9)
  {
    self->_double position = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v9 = *((unsigned char *)v4 + 68);
    if ((v9 & 4) == 0)
    {
LABEL_21:
      if ((v9 & 2) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) == 0)
  {
    goto LABEL_21;
  }
  self->_uint64_t transportType = *((_DWORD *)v4 + 16);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_22:
    self->_double timestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_23:
}

- (SearchResult)startSearchResult
{
  return self->_startSearchResult;
}

- (void)setStartSearchResult:(id)a3
{
}

- (SearchResult)endSearchResult
{
  return self->_endSearchResult;
}

- (void)setEndSearchResult:(id)a3
{
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
}

- (NSString)reportAProblemAttachment
{
  return self->_reportAProblemAttachment;
}

- (void)setReportAProblemAttachment:(id)a3
{
}

- (NSString)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
}

- (double)position
{
  return self->_position;
}

- (int)transportType
{
  return self->_transportType;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_startSearchResult, 0);
  objc_storeStrong((id *)&self->_reportAProblemAttachment, 0);
  objc_storeStrong((id *)&self->_endSearchResult, 0);

  objc_storeStrong((id *)&self->_directionsResponseID, 0);
}

@end