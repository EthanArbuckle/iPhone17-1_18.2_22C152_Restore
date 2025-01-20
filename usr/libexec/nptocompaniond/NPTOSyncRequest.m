@interface NPTOSyncRequest
- (BOOL)hasCollectionTargetList;
- (BOOL)hasLibrary;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPTOCollectionTargetList)collectionTargetList;
- (NPTOLibrary)library;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)npto_assetsRequiringExternalPowerSourceConnected;
- (id)npto_libraryCollectionTargetMap;
- (int)requiringExternalPowerSourceConnectedAssetIndexAtIndex:(unint64_t)a3;
- (int)requiringExternalPowerSourceConnectedAssetIndexs;
- (unint64_t)hash;
- (unint64_t)requiringExternalPowerSourceConnectedAssetIndexsCount;
- (void)addRequiringExternalPowerSourceConnectedAssetIndex:(int)a3;
- (void)clearRequiringExternalPowerSourceConnectedAssetIndexs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCollectionTargetList:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setRequiringExternalPowerSourceConnectedAssetIndexs:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation NPTOSyncRequest

- (id)npto_libraryCollectionTargetMap
{
  v3 = [(NPTOSyncRequest *)self collectionTargetList];
  v4 = [(NPTOSyncRequest *)self library];
  v5 = [v3 collectionTargetMapWithLibrary:v4];

  return v5;
}

- (id)npto_assetsRequiringExternalPowerSourceConnected
{
  v3 = +[NSMutableSet set];
  if ([(NPTOSyncRequest *)self requiringExternalPowerSourceConnectedAssetIndexsCount])
  {
    unint64_t v4 = 0;
    do
    {
      signed int v5 = [(NPTOSyncRequest *)self requiringExternalPowerSourceConnectedAssetIndexAtIndex:v4];
      v6 = [(NPTOSyncRequest *)self library];
      v7 = [v6 assetAtIndex:v5];
      [v3 addObject:v7];

      ++v4;
    }
    while (v4 < [(NPTOSyncRequest *)self requiringExternalPowerSourceConnectedAssetIndexsCount]);
  }
  id v8 = [v3 copy];

  return v8;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NPTOSyncRequest;
  [(NPTOSyncRequest *)&v3 dealloc];
}

- (BOOL)hasLibrary
{
  return self->_library != 0;
}

- (BOOL)hasCollectionTargetList
{
  return self->_collectionTargetList != 0;
}

- (unint64_t)requiringExternalPowerSourceConnectedAssetIndexsCount
{
  return self->_requiringExternalPowerSourceConnectedAssetIndexs.count;
}

- (int)requiringExternalPowerSourceConnectedAssetIndexs
{
  return self->_requiringExternalPowerSourceConnectedAssetIndexs.list;
}

- (void)clearRequiringExternalPowerSourceConnectedAssetIndexs
{
}

- (void)addRequiringExternalPowerSourceConnectedAssetIndex:(int)a3
{
}

- (int)requiringExternalPowerSourceConnectedAssetIndexAtIndex:(unint64_t)a3
{
  p_requiringExternalPowerSourceConnectedAssetIndexs = &self->_requiringExternalPowerSourceConnectedAssetIndexs;
  unint64_t count = self->_requiringExternalPowerSourceConnectedAssetIndexs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_requiringExternalPowerSourceConnectedAssetIndexs->list[a3];
}

- (void)setRequiringExternalPowerSourceConnectedAssetIndexs:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPTOSyncRequest;
  objc_super v3 = [(NPTOSyncRequest *)&v7 description];
  unint64_t v4 = [(NPTOSyncRequest *)self dictionaryRepresentation];
  signed int v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  library = self->_library;
  if (library)
  {
    signed int v5 = [(NPTOLibrary *)library dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"library"];
  }
  collectionTargetList = self->_collectionTargetList;
  if (collectionTargetList)
  {
    objc_super v7 = [(NPTOCollectionTargetList *)collectionTargetList dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"collectionTargetList"];
  }
  id v8 = PBRepeatedInt32NSArray();
  [v3 setObject:v8 forKey:@"requiringExternalPowerSourceConnectedAssetIndex"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        goto LABEL_52;
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
        BOOL v10 = v6++ >= 9;
        if (v10)
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
      int v12 = v7 & 7;
      if (v11 || v12 == 4) {
        goto LABEL_52;
      }
      unint64_t v14 = v7 >> 3;
      if ((v7 >> 3) == 3)
      {
        if (v12 == 2)
        {
          int v16 = PBReaderPlaceMark();
          if (!v16) {
            return v16;
          }
          while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                                      + OBJC_IVAR___PBDataReader__length)
               && !*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
          {
            char v17 = 0;
            unsigned int v18 = 0;
            uint64_t v19 = 0;
            while (1)
            {
              unint64_t v20 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
              if (v20 == -1 || v20 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
                break;
              }
              char v21 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v20);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
              v19 |= (unint64_t)(v21 & 0x7F) << v17;
              if (v21 < 0)
              {
                v17 += 7;
                BOOL v10 = v18++ >= 9;
                if (!v10) {
                  continue;
                }
              }
              goto LABEL_35;
            }
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_35:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (1)
          {
            unint64_t v25 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v25 == -1 || v25 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
            v24 |= (unint64_t)(v26 & 0x7F) << v22;
            if (v26 < 0)
            {
              v22 += 7;
              BOOL v10 = v23++ >= 9;
              if (!v10) {
                continue;
              }
            }
            goto LABEL_50;
          }
          *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_50:
          PBRepeatedInt32Add();
        }
        goto LABEL_51;
      }
      if (v14 == 2) {
        break;
      }
      if (v14 == 1)
      {
        v15 = objc_alloc_init(NPTOLibrary);
        objc_storeStrong((id *)&self->_library, v15);
        if (!PBReaderPlaceMark() || !NPTOLibraryReadFrom(v15, (uint64_t)a3)) {
          goto LABEL_54;
        }
LABEL_38:
        PBReaderRecallMark();

        goto LABEL_51;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        goto LABEL_55;
      }
LABEL_51:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        goto LABEL_52;
    }
    v15 = objc_alloc_init(NPTOCollectionTargetList);
    objc_storeStrong((id *)&self->_collectionTargetList, v15);
    if (!PBReaderPlaceMark() || (NPTOCollectionTargetListReadFrom(v15, (uint64_t)a3) & 1) == 0)
    {
LABEL_54:

LABEL_55:
      LOBYTE(v16) = 0;
      return v16;
    }
    goto LABEL_38;
  }
LABEL_52:
  LOBYTE(v16) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v16;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_library)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_collectionTargetList)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  p_requiringExternalPowerSourceConnectedAssetIndexs = &self->_requiringExternalPowerSourceConnectedAssetIndexs;
  if (p_requiringExternalPowerSourceConnectedAssetIndexs->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_requiringExternalPowerSourceConnectedAssetIndexs->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if (self->_library) {
    [v7 setLibrary:];
  }
  if (self->_collectionTargetList) {
    [v7 setCollectionTargetList:];
  }
  if ([(NPTOSyncRequest *)self requiringExternalPowerSourceConnectedAssetIndexsCount])
  {
    [v7 clearRequiringExternalPowerSourceConnectedAssetIndexs];
    unint64_t v4 = [(NPTOSyncRequest *)self requiringExternalPowerSourceConnectedAssetIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        [v7 addRequiringExternalPowerSourceConnectedAssetIndex:-[NPTOSyncRequest requiringExternalPowerSourceConnectedAssetIndexAtIndex:](self, "requiringExternalPowerSourceConnectedAssetIndexAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NPTOLibrary *)self->_library copyWithZone:a3];
  id v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(NPTOCollectionTargetList *)self->_collectionTargetList copyWithZone:a3];
  char v9 = (void *)v5[4];
  v5[4] = v8;

  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((library = self->_library, !((unint64_t)library | v4[5])) || -[NPTOLibrary isEqual:](library, "isEqual:"))
    && ((collectionTargetList = self->_collectionTargetList, !((unint64_t)collectionTargetList | v4[4]))
     || -[NPTOCollectionTargetList isEqual:](collectionTargetList, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPTOLibrary *)self->_library hash];
  unint64_t v4 = [(NPTOCollectionTargetList *)self->_collectionTargetList hash] ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  library = self->_library;
  uint64_t v6 = v4[5];
  int v12 = v4;
  if (library)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPTOLibrary mergeFrom:](library, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPTOSyncRequest setLibrary:](self, "setLibrary:");
  }
  unint64_t v4 = v12;
LABEL_7:
  collectionTargetList = self->_collectionTargetList;
  uint64_t v8 = v4[4];
  if (collectionTargetList)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPTOCollectionTargetList mergeFrom:](collectionTargetList, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPTOSyncRequest setCollectionTargetList:](self, "setCollectionTargetList:");
  }
  unint64_t v4 = v12;
LABEL_13:
  char v9 = (char *)[v4 requiringExternalPowerSourceConnectedAssetIndexsCount];
  if (v9)
  {
    BOOL v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
      -[NPTOSyncRequest addRequiringExternalPowerSourceConnectedAssetIndex:](self, "addRequiringExternalPowerSourceConnectedAssetIndex:", [v12 requiringExternalPowerSourceConnectedAssetIndexAtIndex:i]);
  }
}

- (NPTOLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (NPTOCollectionTargetList)collectionTargetList
{
  return self->_collectionTargetList;
}

- (void)setCollectionTargetList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_collectionTargetList, 0);
}

@end