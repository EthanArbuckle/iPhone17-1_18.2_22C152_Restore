@interface RapUserProfileRecord
- (BOOL)hasCuratedCollectionIdentifier;
- (BOOL)hasCuratedCollectionProviderIdentifier;
- (BOOL)hasDirections;
- (BOOL)hasMapItemStorage;
- (BOOL)hasMuninViewState;
- (BOOL)hasSubtitle;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemStorage)mapItemStorage;
- (GEOMuninViewState)muninViewState;
- (NSString)curatedCollectionIdentifier;
- (NSString)curatedCollectionProviderIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (RAPDirectionsRecording)directions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCuratedCollectionIdentifier:(id)a3;
- (void)setCuratedCollectionProviderIdentifier:(id)a3;
- (void)setDirections:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setMuninViewState:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RapUserProfileRecord

- (BOOL)hasMapItemStorage
{
  return self->_mapItemStorage != 0;
}

- (BOOL)hasDirections
{
  return self->_directions != 0;
}

- (BOOL)hasCuratedCollectionIdentifier
{
  return self->_curatedCollectionIdentifier != 0;
}

- (BOOL)hasCuratedCollectionProviderIdentifier
{
  return self->_curatedCollectionProviderIdentifier != 0;
}

- (BOOL)hasMuninViewState
{
  return self->_muninViewState != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RapUserProfileRecord;
  v3 = [(RapUserProfileRecord *)&v7 description];
  v4 = [(RapUserProfileRecord *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  mapItemStorage = self->_mapItemStorage;
  if (mapItemStorage)
  {
    v5 = [(GEOMapItemStorage *)mapItemStorage dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"mapItemStorage"];
  }
  directions = self->_directions;
  if (directions)
  {
    objc_super v7 = [(RAPDirectionsRecording *)directions dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"directions"];
  }
  curatedCollectionIdentifier = self->_curatedCollectionIdentifier;
  if (curatedCollectionIdentifier) {
    [v3 setObject:curatedCollectionIdentifier forKey:@"curatedCollectionIdentifier"];
  }
  curatedCollectionProviderIdentifier = self->_curatedCollectionProviderIdentifier;
  if (curatedCollectionProviderIdentifier) {
    [v3 setObject:curatedCollectionProviderIdentifier forKey:@"curatedCollectionProviderIdentifier"];
  }
  muninViewState = self->_muninViewState;
  if (muninViewState)
  {
    v11 = [(GEOMuninViewState *)muninViewState dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"muninViewState"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v3 setObject:subtitle forKey:@"subtitle"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                            + OBJC_IVAR___PBDataReader__length))
    return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  while (2)
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      if (v6++ >= 9)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v7 >> 3))
    {
      case 1u:
        v13 = (RAPDirectionsRecording *)objc_alloc_init((Class)GEOMapItemStorage);
        uint64_t v14 = 32;
        goto LABEL_25;
      case 2u:
        v13 = objc_alloc_init(RAPDirectionsRecording);
        uint64_t v14 = 24;
        goto LABEL_25;
      case 3u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 8;
        goto LABEL_30;
      case 4u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 16;
        goto LABEL_30;
      case 5u:
        v13 = (RAPDirectionsRecording *)objc_alloc_init((Class)GEOMuninViewState);
        uint64_t v14 = 40;
LABEL_25:
        objc_storeStrong((id *)&self->PBCodable_opaque[v14], v13);
        if (PBReaderPlaceMark() && -[RAPDirectionsRecording readFrom:](v13, "readFrom:", a3, 0, 0))
        {
          PBReaderRecallMark();
LABEL_31:

LABEL_32:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          continue;
        }

        return 0;
      case 6u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 56;
        goto LABEL_30;
      case 7u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 48;
LABEL_30:
        v13 = *(RAPDirectionsRecording **)&self->PBCodable_opaque[v16];
        *(void *)&self->PBCodable_opaque[v16] = v15;
        goto LABEL_31;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_32;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mapItemStorage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_directions)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_curatedCollectionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_curatedCollectionProviderIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_muninViewState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mapItemStorage)
  {
    [v4 setMapItemStorage];
    id v4 = v5;
  }
  if (self->_directions)
  {
    [v5 setDirections:];
    id v4 = v5;
  }
  if (self->_curatedCollectionIdentifier)
  {
    [v5 setCuratedCollectionIdentifier:];
    id v4 = v5;
  }
  if (self->_curatedCollectionProviderIdentifier)
  {
    [v5 setCuratedCollectionProviderIdentifier:];
    id v4 = v5;
  }
  if (self->_muninViewState)
  {
    [v5 setMuninViewState:];
    id v4 = v5;
  }
  if (self->_title)
  {
    [v5 setTitle:];
    id v4 = v5;
  }
  if (self->_subtitle)
  {
    [v5 setSubtitle:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(GEOMapItemStorage *)self->_mapItemStorage copyWithZone:a3];
  unint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(RAPDirectionsRecording *)self->_directions copyWithZone:a3];
  char v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSString *)self->_curatedCollectionIdentifier copyWithZone:a3];
  int v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(NSString *)self->_curatedCollectionProviderIdentifier copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(GEOMuninViewState *)self->_muninViewState copyWithZone:a3];
  uint64_t v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(NSString *)self->_title copyWithZone:a3];
  v17 = (void *)v5[7];
  v5[7] = v16;

  id v18 = [(NSString *)self->_subtitle copyWithZone:a3];
  v19 = (void *)v5[6];
  v5[6] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((mapItemStorage = self->_mapItemStorage, !((unint64_t)mapItemStorage | v4[4]))
     || -[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:"))
    && ((directions = self->_directions, !((unint64_t)directions | v4[3]))
     || -[RAPDirectionsRecording isEqual:](directions, "isEqual:"))
    && ((curatedCollectionIdentifier = self->_curatedCollectionIdentifier,
         !((unint64_t)curatedCollectionIdentifier | v4[1]))
     || -[NSString isEqual:](curatedCollectionIdentifier, "isEqual:"))
    && ((curatedCollectionProviderIdentifier = self->_curatedCollectionProviderIdentifier,
         !((unint64_t)curatedCollectionProviderIdentifier | v4[2]))
     || -[NSString isEqual:](curatedCollectionProviderIdentifier, "isEqual:"))
    && ((muninViewState = self->_muninViewState, !((unint64_t)muninViewState | v4[5]))
     || -[GEOMuninViewState isEqual:](muninViewState, "isEqual:"))
    && ((title = self->_title, !((unint64_t)title | v4[7]))
     || -[NSString isEqual:](title, "isEqual:")))
  {
    subtitle = self->_subtitle;
    if ((unint64_t)subtitle | v4[6]) {
      unsigned __int8 v12 = -[NSString isEqual:](subtitle, "isEqual:");
    }
    else {
      unsigned __int8 v12 = 1;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(GEOMapItemStorage *)self->_mapItemStorage hash];
  unint64_t v4 = [(RAPDirectionsRecording *)self->_directions hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_curatedCollectionIdentifier hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_curatedCollectionProviderIdentifier hash];
  unint64_t v7 = (unint64_t)[(GEOMuninViewState *)self->_muninViewState hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_title hash];
  return v6 ^ v8 ^ [(NSString *)self->_subtitle hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  mapItemStorage = self->_mapItemStorage;
  int v11 = v4;
  uint64_t v6 = v4[4];
  if (mapItemStorage)
  {
    if (v6) {
      -[GEOMapItemStorage mergeFrom:](mapItemStorage, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[RapUserProfileRecord setMapItemStorage:](self, "setMapItemStorage:");
  }
  directions = self->_directions;
  uint64_t v8 = v11[3];
  if (directions)
  {
    if (v8) {
      -[RAPDirectionsRecording mergeFrom:](directions, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[RapUserProfileRecord setDirections:](self, "setDirections:");
  }
  if (v11[1]) {
    -[RapUserProfileRecord setCuratedCollectionIdentifier:](self, "setCuratedCollectionIdentifier:");
  }
  if (v11[2]) {
    -[RapUserProfileRecord setCuratedCollectionProviderIdentifier:](self, "setCuratedCollectionProviderIdentifier:");
  }
  muninViewState = self->_muninViewState;
  uint64_t v10 = v11[5];
  if (muninViewState)
  {
    if (v10) {
      -[GEOMuninViewState mergeFrom:](muninViewState, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[RapUserProfileRecord setMuninViewState:](self, "setMuninViewState:");
  }
  if (v11[7]) {
    -[RapUserProfileRecord setTitle:](self, "setTitle:");
  }
  if (v11[6]) {
    -[RapUserProfileRecord setSubtitle:](self, "setSubtitle:");
  }
}

- (GEOMapItemStorage)mapItemStorage
{
  return self->_mapItemStorage;
}

- (void)setMapItemStorage:(id)a3
{
}

- (RAPDirectionsRecording)directions
{
  return self->_directions;
}

- (void)setDirections:(id)a3
{
}

- (NSString)curatedCollectionIdentifier
{
  return self->_curatedCollectionIdentifier;
}

- (void)setCuratedCollectionIdentifier:(id)a3
{
}

- (NSString)curatedCollectionProviderIdentifier
{
  return self->_curatedCollectionProviderIdentifier;
}

- (void)setCuratedCollectionProviderIdentifier:(id)a3
{
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (void)setMuninViewState:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);
  objc_storeStrong((id *)&self->_directions, 0);
  objc_storeStrong((id *)&self->_curatedCollectionProviderIdentifier, 0);

  objc_storeStrong((id *)&self->_curatedCollectionIdentifier, 0);
}

@end