@interface NPTOCollectionTargetItem
- (BOOL)hasCollectionMetadata;
- (BOOL)hasCollectionTarget;
- (BOOL)hasSubtitle;
- (BOOL)hasSubtype;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)hasUuidData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)collectionMetadata;
- (NSData)uuidData;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subtypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsSubtype:(id)a3;
- (int)StringAsType:(id)a3;
- (int)assetIndexAtIndex:(unint64_t)a3;
- (int)assetIndexs;
- (int)collectionTarget;
- (int)keyAssetIndexAtIndex:(unint64_t)a3;
- (int)keyAssetIndexs;
- (int)subtype;
- (int)type;
- (unint64_t)assetIndexsCount;
- (unint64_t)hash;
- (unint64_t)keyAssetIndexsCount;
- (void)addAssetIndex:(int)a3;
- (void)addKeyAssetIndex:(int)a3;
- (void)clearAssetIndexs;
- (void)clearKeyAssetIndexs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssetIndexs:(int *)a3 count:(unint64_t)a4;
- (void)setCollectionMetadata:(id)a3;
- (void)setCollectionTarget:(int)a3;
- (void)setHasCollectionTarget:(BOOL)a3;
- (void)setHasSubtype:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setKeyAssetIndexs:(int *)a3 count:(unint64_t)a4;
- (void)setSubtitle:(id)a3;
- (void)setSubtype:(int)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)setUuidData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPTOCollectionTargetItem

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NPTOCollectionTargetItem;
  [(NPTOCollectionTargetItem *)&v3 dealloc];
}

- (BOOL)hasUuidData
{
  return self->_uuidData != 0;
}

- (void)setCollectionTarget:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_collectionTarget = a3;
}

- (void)setHasCollectionTarget:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCollectionTarget
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)assetIndexsCount
{
  return self->_assetIndexs.count;
}

- (int)assetIndexs
{
  return self->_assetIndexs.list;
}

- (void)clearAssetIndexs
{
}

- (void)addAssetIndex:(int)a3
{
}

- (int)assetIndexAtIndex:(unint64_t)a3
{
  p_assetIndexs = &self->_assetIndexs;
  unint64_t count = self->_assetIndexs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_assetIndexs->list[a3];
}

- (void)setAssetIndexs:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)keyAssetIndexsCount
{
  return self->_keyAssetIndexs.count;
}

- (int)keyAssetIndexs
{
  return self->_keyAssetIndexs.list;
}

- (void)clearKeyAssetIndexs
{
}

- (void)addKeyAssetIndex:(int)a3
{
}

- (int)keyAssetIndexAtIndex:(unint64_t)a3
{
  p_keyAssetIndexs = &self->_keyAssetIndexs;
  unint64_t count = self->_keyAssetIndexs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_keyAssetIndexs->list[a3];
}

- (void)setKeyAssetIndexs:(int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasCollectionMetadata
{
  return self->_collectionMetadata != 0;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100093680[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Album"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SmartAlbum"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Moment"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)subtype
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_subtype;
  }
  else {
    return 0;
  }
}

- (void)setSubtype:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_subtype = a3;
}

- (void)setHasSubtype:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubtype
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)subtypeAsString:(int)a3
{
  if (a3 <= 99)
  {
    if (a3)
    {
      if (a3 != 2)
      {
LABEL_22:
        int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
        return v4;
      }
      int v4 = @"AlbumRegular";
    }
    else
    {
      int v4 = @"AlbumAny";
    }
  }
  else
  {
    switch(a3)
    {
      case 100:
        int v4 = @"AlbumMyPhotoStream";
        break;
      case 101:
        int v4 = @"AlbumCloudShared";
        break;
      case 203:
        int v4 = @"SmartAlbumFavorites";
        return v4;
      default:
        goto LABEL_22;
    }
  }
  return v4;
}

- (int)StringAsSubtype:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AlbumAny"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AlbumRegular"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AlbumMyPhotoStream"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"AlbumCloudShared"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"SmartAlbumFavorites"])
  {
    int v4 = 203;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPTOCollectionTargetItem;
  id v3 = [(NPTOCollectionTargetItem *)&v7 description];
  int v4 = [(NPTOCollectionTargetItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  uuidData = self->_uuidData;
  if (uuidData) {
    [v3 setObject:uuidData forKey:@"uuidData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithInt:self->_collectionTarget];
    [v4 setObject:v6 forKey:@"collectionTarget"];
  }
  objc_super v7 = PBRepeatedInt32NSArray();
  [v4 setObject:v7 forKey:@"assetIndex"];

  v8 = PBRepeatedInt32NSArray();
  [v4 setObject:v8 forKey:@"keyAssetIndex"];

  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  collectionMetadata = self->_collectionMetadata;
  if (collectionMetadata) {
    [v4 setObject:collectionMetadata forKey:@"collectionMetadata"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v14 = off_100093680[type];
    }
    [v4 setObject:v14 forKey:@"type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    subuint64_t type = self->_subtype;
    if (subtype <= 99)
    {
      if (!subtype)
      {
        v16 = @"AlbumAny";
        goto LABEL_29;
      }
      if (subtype == 2)
      {
        v16 = @"AlbumRegular";
        goto LABEL_29;
      }
    }
    else
    {
      switch(subtype)
      {
        case 100:
          v16 = @"AlbumMyPhotoStream";
          goto LABEL_29;
        case 101:
          v16 = @"AlbumCloudShared";
          goto LABEL_29;
        case 203:
          v16 = @"SmartAlbumFavorites";
LABEL_29:
          [v4 setObject:v16 forKey:@"subtype"];

          goto LABEL_30;
      }
    }
    v16 = +[NSString stringWithFormat:@"(unknown: %i)", self->_subtype];
    goto LABEL_29;
  }
LABEL_30:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPTOCollectionTargetItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_uuidData)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
  if (self->_assetIndexs.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v8;
      ++v5;
    }
    while (v5 < self->_assetIndexs.count);
  }
  if (self->_keyAssetIndexs.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v8;
      ++v6;
    }
    while (v6 < self->_keyAssetIndexs.count);
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_collectionMetadata)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_uuidData)
  {
    [v4 setUuidData:];
    id v4 = v13;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 16) = self->_collectionTarget;
    *((unsigned char *)v4 + 112) |= 1u;
  }
  if ([(NPTOCollectionTargetItem *)self assetIndexsCount])
  {
    [v13 clearAssetIndexs];
    unint64_t v5 = [(NPTOCollectionTargetItem *)self assetIndexsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [v13 addAssetIndex:-[NPTOCollectionTargetItem assetIndexAtIndex:](self, "assetIndexAtIndex:", i)];
    }
  }
  if ([(NPTOCollectionTargetItem *)self keyAssetIndexsCount])
  {
    [v13 clearKeyAssetIndexs];
    unint64_t v8 = [(NPTOCollectionTargetItem *)self keyAssetIndexsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [v13 addKeyAssetIndex:-[NPTOCollectionTargetItem keyAssetIndexAtIndex:](self, "keyAssetIndexAtIndex:", j)];
    }
  }
  if (self->_title) {
    [v13 setTitle:];
  }
  v11 = v13;
  if (self->_subtitle)
  {
    [v13 setSubtitle:];
    v11 = v13;
  }
  if (self->_collectionMetadata)
  {
    [v13 setCollectionMetadata:];
    v11 = v13;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v11[24] = self->_type;
    *((unsigned char *)v11 + 112) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v11[20] = self->_subtype;
    *((unsigned char *)v11 + 112) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_uuidData copyWithZone:a3];
  objc_super v7 = (void *)v5[13];
  v5[13] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 16) = self->_collectionTarget;
    *((unsigned char *)v5 + 112) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  id v8 = [(NSString *)self->_title copyWithZone:a3];
  unint64_t v9 = (void *)v5[11];
  v5[11] = v8;

  id v10 = [(NSString *)self->_subtitle copyWithZone:a3];
  v11 = (void *)v5[9];
  v5[9] = v10;

  id v12 = [(NSData *)self->_collectionMetadata copyWithZone:a3];
  id v13 = (void *)v5[7];
  v5[7] = v12;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_type;
    *((unsigned char *)v5 + 112) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 20) = self->_subtype;
    *((unsigned char *)v5 + 112) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  uuidData = self->_uuidData;
  if ((unint64_t)uuidData | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](uuidData, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_collectionTarget != *((_DWORD *)v4 + 16)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 112))
  {
LABEL_26:
    BOOL v9 = 0;
    goto LABEL_27;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_26;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_26;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_26;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_26;
    }
  }
  collectionMetadata = self->_collectionMetadata;
  if ((unint64_t)collectionMetadata | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](collectionMetadata, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 4) == 0 || self->_type != *((_DWORD *)v4 + 24)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 4) != 0)
  {
    goto LABEL_26;
  }
  BOOL v9 = (*((unsigned char *)v4 + 112) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 2) == 0 || self->_subtype != *((_DWORD *)v4 + 20)) {
      goto LABEL_26;
    }
    BOOL v9 = 1;
  }
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_uuidData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_collectionTarget;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = PBRepeatedInt32Hash();
  uint64_t v6 = PBRepeatedInt32Hash();
  NSUInteger v7 = [(NSString *)self->_title hash];
  NSUInteger v8 = [(NSString *)self->_subtitle hash];
  unint64_t v9 = (unint64_t)[(NSData *)self->_collectionMetadata hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v11 = 2654435761 * self->_subtype;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (*((void *)v4 + 13))
  {
    -[NPTOCollectionTargetItem setUuidData:](self, "setUuidData:");
    id v4 = v13;
  }
  if (*((unsigned char *)v4 + 112))
  {
    self->_collectionTarget = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = (char *)[v4 assetIndexsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[NPTOCollectionTargetItem addAssetIndex:](self, "addAssetIndex:", [v13 assetIndexAtIndex:i]);
  }
  NSUInteger v8 = (char *)[v13 keyAssetIndexsCount];
  if (v8)
  {
    unint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[NPTOCollectionTargetItem addKeyAssetIndex:](self, "addKeyAssetIndex:", [v13 keyAssetIndexAtIndex:j]);
  }
  uint64_t v11 = v13;
  if (v13[11])
  {
    -[NPTOCollectionTargetItem setTitle:](self, "setTitle:");
    uint64_t v11 = v13;
  }
  if (v11[9])
  {
    -[NPTOCollectionTargetItem setSubtitle:](self, "setSubtitle:");
    uint64_t v11 = v13;
  }
  if (v11[7])
  {
    -[NPTOCollectionTargetItem setCollectionMetadata:](self, "setCollectionMetadata:");
    uint64_t v11 = v13;
  }
  char v12 = *((unsigned char *)v11 + 112);
  if ((v12 & 4) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v11 + 24);
    *(unsigned char *)&self->_has |= 4u;
    char v12 = *((unsigned char *)v11 + 112);
  }
  if ((v12 & 2) != 0)
  {
    self->_subuint64_t type = *((_DWORD *)v11 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)uuidData
{
  return self->_uuidData;
}

- (void)setUuidData:(id)a3
{
}

- (int)collectionTarget
{
  return self->_collectionTarget;
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

- (NSData)collectionMetadata
{
  return self->_collectionMetadata;
}

- (void)setCollectionMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidData, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_collectionMetadata, 0);
}

@end