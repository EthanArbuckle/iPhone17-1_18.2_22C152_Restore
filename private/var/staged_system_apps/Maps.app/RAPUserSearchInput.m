@interface RAPUserSearchInput
- (BOOL)hasCompletionStorage;
- (BOOL)hasCoordinate;
- (BOOL)hasFindMyHandleID;
- (BOOL)hasOrigin;
- (BOOL)hasPlaceMapItemStorage;
- (BOOL)hasSearchString;
- (BOOL)hasSingleLineAddressString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)coordinate;
- (GEOMapItemStorage)placeMapItemStorage;
- (GEOStorageCompletion)completionStorage;
- (NSString)findMyHandleID;
- (NSString)searchString;
- (NSString)singleLineAddressString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)originAsString:(int)a3;
- (int)StringAsOrigin:(id)a3;
- (int)origin;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompletionStorage:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setFindMyHandleID:(id)a3;
- (void)setHasOrigin:(BOOL)a3;
- (void)setOrigin:(int)a3;
- (void)setPlaceMapItemStorage:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSingleLineAddressString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RAPUserSearchInput

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (BOOL)hasSingleLineAddressString
{
  return self->_singleLineAddressString != 0;
}

- (BOOL)hasPlaceMapItemStorage
{
  return self->_placeMapItemStorage != 0;
}

- (BOOL)hasCompletionStorage
{
  return self->_completionStorage != 0;
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (void)setOrigin:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOrigin
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 >= 4)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1012FA4D8[a3];
  }

  return v3;
}

- (int)StringAsOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTACT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CURRENT_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DROPPED_PIN"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasFindMyHandleID
{
  return self->_findMyHandleID != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RAPUserSearchInput;
  id v3 = [(RAPUserSearchInput *)&v7 description];
  int v4 = [(RAPUserSearchInput *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  searchString = self->_searchString;
  if (searchString) {
    [v3 setObject:searchString forKey:@"searchString"];
  }
  singleLineAddressString = self->_singleLineAddressString;
  if (singleLineAddressString) {
    [v4 setObject:singleLineAddressString forKey:@"singleLineAddressString"];
  }
  placeMapItemStorage = self->_placeMapItemStorage;
  if (placeMapItemStorage)
  {
    v8 = [(GEOMapItemStorage *)placeMapItemStorage dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"placeMapItemStorage"];
  }
  completionStorage = self->_completionStorage;
  if (completionStorage)
  {
    v10 = [(GEOStorageCompletion *)completionStorage dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"completionStorage"];
  }
  coordinate = self->_coordinate;
  if (coordinate)
  {
    v12 = [(GEOLatLng *)coordinate dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"coordinate"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t origin = self->_origin;
    if (origin >= 4)
    {
      v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_origin];
    }
    else
    {
      v14 = off_1012FA4D8[origin];
    }
    [v4 setObject:v14 forKey:@"origin"];
  }
  findMyHandleID = self->_findMyHandleID;
  if (findMyHandleID) {
    [v4 setObject:findMyHandleID forKey:@"findMyHandleID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10083ED40((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_searchString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_singleLineAddressString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_placeMapItemStorage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_completionStorage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_coordinate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_findMyHandleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_searchString)
  {
    [v4 setSearchString:];
    id v4 = v5;
  }
  if (self->_singleLineAddressString)
  {
    [v5 setSingleLineAddressString];
    id v4 = v5;
  }
  if (self->_placeMapItemStorage)
  {
    [v5 setPlaceMapItemStorage:];
    id v4 = v5;
  }
  if (self->_completionStorage)
  {
    [v5 setCompletionStorage:];
    id v4 = v5;
  }
  if (self->_coordinate)
  {
    [v5 setCoordinate:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_origin;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if (self->_findMyHandleID)
  {
    [v5 setFindMyHandleID:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_searchString copyWithZone:a3];
  objc_super v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = [(NSString *)self->_singleLineAddressString copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = [(GEOMapItemStorage *)self->_placeMapItemStorage copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(GEOStorageCompletion *)self->_completionStorage copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  id v14 = [(GEOLatLng *)self->_coordinate copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 8) = self->_origin;
    *((unsigned char *)v5 + 64) |= 1u;
  }
  id v16 = [(NSString *)self->_findMyHandleID copyWithZone:a3];
  v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](searchString, "isEqual:")) {
      goto LABEL_19;
    }
  }
  singleLineAddressString = self->_singleLineAddressString;
  if ((unint64_t)singleLineAddressString | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](singleLineAddressString, "isEqual:")) {
      goto LABEL_19;
    }
  }
  placeMapItemStorage = self->_placeMapItemStorage;
  if ((unint64_t)placeMapItemStorage | *((void *)v4 + 5))
  {
    if (!-[GEOMapItemStorage isEqual:](placeMapItemStorage, "isEqual:")) {
      goto LABEL_19;
    }
  }
  completionStorage = self->_completionStorage;
  if ((unint64_t)completionStorage | *((void *)v4 + 1))
  {
    if (!-[GEOStorageCompletion isEqual:](completionStorage, "isEqual:")) {
      goto LABEL_19;
    }
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_origin != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    unsigned __int8 v11 = 0;
    goto LABEL_20;
  }
  findMyHandleID = self->_findMyHandleID;
  if ((unint64_t)findMyHandleID | *((void *)v4 + 3)) {
    unsigned __int8 v11 = -[NSString isEqual:](findMyHandleID, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_searchString hash];
  NSUInteger v4 = [(NSString *)self->_singleLineAddressString hash];
  unint64_t v5 = (unint64_t)[(GEOMapItemStorage *)self->_placeMapItemStorage hash];
  unint64_t v6 = (unint64_t)[(GEOStorageCompletion *)self->_completionStorage hash];
  unint64_t v7 = (unint64_t)[(GEOLatLng *)self->_coordinate hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_origin;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_findMyHandleID hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  unsigned __int8 v11 = v4;
  if (*((void *)v4 + 6))
  {
    -[RAPUserSearchInput setSearchString:](self, "setSearchString:");
    NSUInteger v4 = v11;
  }
  if (*((void *)v4 + 7))
  {
    -[RAPUserSearchInput setSingleLineAddressString:](self, "setSingleLineAddressString:");
    NSUInteger v4 = v11;
  }
  placeMapItemStorage = self->_placeMapItemStorage;
  uint64_t v6 = *((void *)v4 + 5);
  if (placeMapItemStorage)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOMapItemStorage mergeFrom:](placeMapItemStorage, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[RAPUserSearchInput setPlaceMapItemStorage:](self, "setPlaceMapItemStorage:");
  }
  NSUInteger v4 = v11;
LABEL_11:
  completionStorage = self->_completionStorage;
  uint64_t v8 = *((void *)v4 + 1);
  if (completionStorage)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEOStorageCompletion mergeFrom:](completionStorage, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[RAPUserSearchInput setCompletionStorage:](self, "setCompletionStorage:");
  }
  NSUInteger v4 = v11;
LABEL_17:
  coordinate = self->_coordinate;
  uint64_t v10 = *((void *)v4 + 2);
  if (coordinate)
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[RAPUserSearchInput setCoordinate:](self, "setCoordinate:");
  }
  NSUInteger v4 = v11;
LABEL_23:
  if (v4[16])
  {
    self->_uint64_t origin = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[RAPUserSearchInput setFindMyHandleID:](self, "setFindMyHandleID:");
    NSUInteger v4 = v11;
  }
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (NSString)singleLineAddressString
{
  return self->_singleLineAddressString;
}

- (void)setSingleLineAddressString:(id)a3
{
}

- (GEOMapItemStorage)placeMapItemStorage
{
  return self->_placeMapItemStorage;
}

- (void)setPlaceMapItemStorage:(id)a3
{
}

- (GEOStorageCompletion)completionStorage
{
  return self->_completionStorage;
}

- (void)setCompletionStorage:(id)a3
{
}

- (GEOLatLng)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
}

- (int)origin
{
  return self->_origin;
}

- (NSString)findMyHandleID
{
  return self->_findMyHandleID;
}

- (void)setFindMyHandleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleLineAddressString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_placeMapItemStorage, 0);
  objc_storeStrong((id *)&self->_findMyHandleID, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);

  objc_storeStrong((id *)&self->_completionStorage, 0);
}

@end