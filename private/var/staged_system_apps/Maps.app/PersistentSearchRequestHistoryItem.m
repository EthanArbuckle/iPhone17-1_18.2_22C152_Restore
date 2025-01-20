@interface PersistentSearchRequestHistoryItem
- (BOOL)hasDisplayLocation;
- (BOOL)hasDisplayQuery;
- (BOOL)hasLatitude;
- (BOOL)hasLatitudeSpan;
- (BOOL)hasLongitude;
- (BOOL)hasLongitudeSpan;
- (BOOL)hasPosition;
- (BOOL)hasRequest;
- (BOOL)hasResponse;
- (BOOL)hasSyncIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPlaceSearchRequest)request;
- (GEOPlaceSearchResponse)response;
- (NSString)displayLocation;
- (NSString)displayQuery;
- (NSString)syncIdentifier;
- (double)latitude;
- (double)latitudeSpan;
- (double)longitude;
- (double)longitudeSpan;
- (double)position;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayLocation:(id)a3;
- (void)setDisplayQuery:(id)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLatitudeSpan:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasLongitudeSpan:(BOOL)a3;
- (void)setHasPosition:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLatitudeSpan:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setLongitudeSpan:(double)a3;
- (void)setPosition:(double)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSyncIdentifier:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PersistentSearchRequestHistoryItem

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasDisplayQuery
{
  return self->_displayQuery != 0;
}

- (BOOL)hasDisplayLocation
{
  return self->_displayLocation != 0;
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
  *(unsigned char *)&self->_has |= 4u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLatitudeSpan:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_latitudeSpan = a3;
}

- (void)setHasLatitudeSpan:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLatitudeSpan
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLongitudeSpan:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_longitudeSpan = a3;
}

- (void)setHasLongitudeSpan:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLongitudeSpan
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setPosition:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPosition
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PersistentSearchRequestHistoryItem;
  char v3 = [(PersistentSearchRequestHistoryItem *)&v7 description];
  v4 = [(PersistentSearchRequestHistoryItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  request = self->_request;
  if (request)
  {
    v5 = [(GEOPlaceSearchRequest *)request dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request"];
  }
  displayQuery = self->_displayQuery;
  if (displayQuery) {
    [v3 setObject:displayQuery forKey:@"displayQuery"];
  }
  displayLocation = self->_displayLocation;
  if (displayLocation) {
    [v3 setObject:displayLocation forKey:@"displayLocation"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v17 = +[NSNumber numberWithDouble:self->_latitude];
    [v3 setObject:v17 forKey:@"latitude"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  v18 = +[NSNumber numberWithDouble:self->_longitude];
  [v3 setObject:v18 forKey:@"longitude"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_25:
  v19 = +[NSNumber numberWithDouble:self->_latitudeSpan];
  [v3 setObject:v19 forKey:@"latitudeSpan"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    v9 = +[NSNumber numberWithDouble:self->_longitudeSpan];
    [v3 setObject:v9 forKey:@"longitudeSpan"];
  }
LABEL_12:
  response = self->_response;
  if (response)
  {
    v11 = [(GEOPlaceSearchResponse *)response dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"response"];
  }
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier) {
    [v3 setObject:syncIdentifier forKey:@"syncIdentifier"];
  }
  char v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    v14 = +[NSNumber numberWithDouble:self->_position];
    [v3 setObject:v14 forKey:@"position"];

    char v13 = (char)self->_has;
  }
  if ((v13 & 0x20) != 0)
  {
    v15 = +[NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v15 forKey:@"timestamp"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100BAABA8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_displayQuery)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_displayLocation)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
LABEL_12:
  if (self->_response)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_syncIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_request)
  {
    [v4 setRequest:];
    id v4 = v7;
  }
  if (self->_displayQuery)
  {
    [v7 setDisplayQuery:];
    id v4 = v7;
  }
  if (self->_displayLocation)
  {
    [v7 setDisplayLocation:];
    id v4 = v7;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_latitude;
    *((unsigned char *)v4 + 96) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 3) = *(void *)&self->_longitude;
  *((unsigned char *)v4 + 96) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_25:
  *((void *)v4 + 2) = *(void *)&self->_latitudeSpan;
  *((unsigned char *)v4 + 96) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((void *)v4 + 4) = *(void *)&self->_longitudeSpan;
    *((unsigned char *)v4 + 96) |= 8u;
  }
LABEL_12:
  if (self->_response)
  {
    [v7 setResponse:];
    id v4 = v7;
  }
  if (self->_syncIdentifier)
  {
    [v7 setSyncIdentifier:];
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((void *)v4 + 5) = *(void *)&self->_position;
    *((unsigned char *)v4 + 96) |= 0x10u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    *((void *)v4 + 6) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 96) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPlaceSearchRequest *)self->_request copyWithZone:a3];
  id v7 = (void *)v5[9];
  v5[9] = v6;

  id v8 = [(NSString *)self->_displayQuery copyWithZone:a3];
  v9 = (void *)v5[8];
  v5[8] = v8;

  id v10 = [(NSString *)self->_displayLocation copyWithZone:a3];
  v11 = (void *)v5[7];
  v5[7] = v10;

  char has = (char)self->_has;
  if (has)
  {
    v5[1] = *(void *)&self->_latitude;
    *((unsigned char *)v5 + 96) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = *(void *)&self->_longitude;
  *((unsigned char *)v5 + 96) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  v5[2] = *(void *)&self->_latitudeSpan;
  *((unsigned char *)v5 + 96) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5[4] = *(void *)&self->_longitudeSpan;
    *((unsigned char *)v5 + 96) |= 8u;
  }
LABEL_6:
  id v13 = [(GEOPlaceSearchResponse *)self->_response copyWithZone:a3];
  v14 = (void *)v5[10];
  v5[10] = v13;

  id v15 = [(NSString *)self->_syncIdentifier copyWithZone:a3];
  v16 = (void *)v5[11];
  v5[11] = v15;

  char v17 = (char)self->_has;
  if ((v17 & 0x10) != 0)
  {
    v5[5] = *(void *)&self->_position;
    *((unsigned char *)v5 + 96) |= 0x10u;
    char v17 = (char)self->_has;
  }
  if ((v17 & 0x20) != 0)
  {
    v5[6] = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 96) |= 0x20u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  request = self->_request;
  if ((unint64_t)request | *((void *)v4 + 9))
  {
    if (!-[GEOPlaceSearchRequest isEqual:](request, "isEqual:")) {
      goto LABEL_41;
    }
  }
  displayQuery = self->_displayQuery;
  if ((unint64_t)displayQuery | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](displayQuery, "isEqual:")) {
      goto LABEL_41;
    }
  }
  displayLocation = self->_displayLocation;
  if ((unint64_t)displayLocation | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](displayLocation, "isEqual:")) {
      goto LABEL_41;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_latitude != *((double *)v4 + 1)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
LABEL_41:
    BOOL v10 = 0;
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_longitude != *((double *)v4 + 3)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_latitudeSpan != *((double *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 8) == 0 || self->_longitudeSpan != *((double *)v4 + 4)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
    goto LABEL_41;
  }
  response = self->_response;
  if ((unint64_t)response | *((void *)v4 + 10)
    && !-[GEOPlaceSearchResponse isEqual:](response, "isEqual:"))
  {
    goto LABEL_41;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](syncIdentifier, "isEqual:")) {
      goto LABEL_41;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 0x10) == 0 || self->_position != *((double *)v4 + 5)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  BOOL v10 = (*((unsigned char *)v4 + 96) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 0x20) == 0 || self->_timestamp != *((double *)v4 + 6)) {
      goto LABEL_41;
    }
    BOOL v10 = 1;
  }
LABEL_42:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v40 = (unint64_t)[(GEOPlaceSearchRequest *)self->_request hash];
  NSUInteger v39 = [(NSString *)self->_displayQuery hash];
  NSUInteger v38 = [(NSString *)self->_displayLocation hash];
  char has = (char)self->_has;
  if (has)
  {
    double latitude = self->_latitude;
    double v6 = -latitude;
    if (latitude >= 0.0) {
      double v6 = self->_latitude;
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
  if ((has & 4) != 0)
  {
    double longitude = self->_longitude;
    double v11 = -longitude;
    if (longitude >= 0.0) {
      double v11 = self->_longitude;
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
  if ((has & 2) != 0)
  {
    double latitudeSpan = self->_latitudeSpan;
    double v16 = -latitudeSpan;
    if (latitudeSpan >= 0.0) {
      double v16 = self->_latitudeSpan;
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
    double longitudeSpan = self->_longitudeSpan;
    double v21 = -longitudeSpan;
    if (longitudeSpan >= 0.0) {
      double v21 = self->_longitudeSpan;
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
  unint64_t v24 = (unint64_t)[(GEOPlaceSearchResponse *)self->_response hash];
  NSUInteger v25 = [(NSString *)self->_syncIdentifier hash];
  char v26 = (char)self->_has;
  if ((v26 & 0x10) != 0)
  {
    double position = self->_position;
    double v29 = -position;
    if (position >= 0.0) {
      double v29 = self->_position;
    }
    long double v30 = floor(v29 + 0.5);
    double v31 = (v29 - v30) * 1.84467441e19;
    unint64_t v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0) {
        v27 += (unint64_t)v31;
      }
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    unint64_t v27 = 0;
  }
  if ((v26 & 0x20) != 0)
  {
    double timestamp = self->_timestamp;
    double v34 = -timestamp;
    if (timestamp >= 0.0) {
      double v34 = self->_timestamp;
    }
    long double v35 = floor(v34 + 0.5);
    double v36 = (v34 - v35) * 1.84467441e19;
    unint64_t v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0) {
        v32 += (unint64_t)v36;
      }
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    unint64_t v32 = 0;
  }
  return v39 ^ v40 ^ v38 ^ v4 ^ v9 ^ v14 ^ v19 ^ v24 ^ v25 ^ v27 ^ v32;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  request = self->_request;
  uint64_t v6 = *((void *)v4 + 9);
  id v11 = v4;
  if (request)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOPlaceSearchRequest mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PersistentSearchRequestHistoryItem setRequest:](self, "setRequest:");
  }
  id v4 = v11;
LABEL_7:
  if (*((void *)v4 + 8))
  {
    -[PersistentSearchRequestHistoryItem setDisplayQuery:](self, "setDisplayQuery:");
    id v4 = v11;
  }
  if (*((void *)v4 + 7))
  {
    -[PersistentSearchRequestHistoryItem setDisplayLocation:](self, "setDisplayLocation:");
    id v4 = v11;
  }
  char v7 = *((unsigned char *)v4 + 96);
  if (v7)
  {
    self->_double latitude = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 96);
    if ((v7 & 4) == 0)
    {
LABEL_13:
      if ((v7 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_double longitude = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v7 = *((unsigned char *)v4 + 96);
  if ((v7 & 2) == 0)
  {
LABEL_14:
    if ((v7 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_21:
  self->_double latitudeSpan = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
LABEL_15:
    self->_double longitudeSpan = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_16:
  response = self->_response;
  uint64_t v9 = *((void *)v4 + 10);
  if (response)
  {
    if (!v9) {
      goto LABEL_26;
    }
    -[GEOPlaceSearchResponse mergeFrom:](response, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_26;
    }
    -[PersistentSearchRequestHistoryItem setResponse:](self, "setResponse:");
  }
  id v4 = v11;
LABEL_26:
  if (*((void *)v4 + 11))
  {
    -[PersistentSearchRequestHistoryItem setSyncIdentifier:](self, "setSyncIdentifier:");
    id v4 = v11;
  }
  char v10 = *((unsigned char *)v4 + 96);
  if ((v10 & 0x10) != 0)
  {
    self->_double position = *((double *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
    char v10 = *((unsigned char *)v4 + 96);
  }
  if ((v10 & 0x20) != 0)
  {
    self->_double timestamp = *((double *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
  }
}

- (GEOPlaceSearchRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSString)displayQuery
{
  return self->_displayQuery;
}

- (void)setDisplayQuery:(id)a3
{
}

- (NSString)displayLocation
{
  return self->_displayLocation;
}

- (void)setDisplayLocation:(id)a3
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

- (double)latitudeSpan
{
  return self->_latitudeSpan;
}

- (double)longitudeSpan
{
  return self->_longitudeSpan;
}

- (GEOPlaceSearchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
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

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_displayQuery, 0);

  objc_storeStrong((id *)&self->_displayLocation, 0);
}

@end