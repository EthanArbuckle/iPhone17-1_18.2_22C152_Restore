@interface BCReadingStatisticsProtoBook
+ (Class)readCFIType;
+ (Class)tocEntryType;
- (BOOL)hasAssetVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)readCFIs;
- (NSMutableArray)tocEntrys;
- (NSString)appVersion;
- (NSString)assetID;
- (NSString)assetVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)readCFIAtIndex:(unint64_t)a3;
- (id)tocEntryAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)readCFIsCount;
- (unint64_t)tocEntrysCount;
- (void)addReadCFI:(id)a3;
- (void)addTocEntry:(id)a3;
- (void)clearReadCFIs;
- (void)clearTocEntrys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setReadCFIs:(id)a3;
- (void)setTocEntrys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCReadingStatisticsProtoBook

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)clearTocEntrys
{
}

- (void)addTocEntry:(id)a3
{
  id v4 = a3;
  tocEntrys = self->_tocEntrys;
  id v8 = v4;
  if (!tocEntrys)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_tocEntrys;
    self->_tocEntrys = v6;

    id v4 = v8;
    tocEntrys = self->_tocEntrys;
  }
  [(NSMutableArray *)tocEntrys addObject:v4];
}

- (unint64_t)tocEntrysCount
{
  return (unint64_t)[(NSMutableArray *)self->_tocEntrys count];
}

- (id)tocEntryAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_tocEntrys objectAtIndex:a3];
}

+ (Class)tocEntryType
{
  return (Class)objc_opt_class();
}

- (void)clearReadCFIs
{
}

- (void)addReadCFI:(id)a3
{
  id v4 = a3;
  readCFIs = self->_readCFIs;
  id v8 = v4;
  if (!readCFIs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_readCFIs;
    self->_readCFIs = v6;

    id v4 = v8;
    readCFIs = self->_readCFIs;
  }
  [(NSMutableArray *)readCFIs addObject:v4];
}

- (unint64_t)readCFIsCount
{
  return (unint64_t)[(NSMutableArray *)self->_readCFIs count];
}

- (id)readCFIAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_readCFIs objectAtIndex:a3];
}

+ (Class)readCFIType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BCReadingStatisticsProtoBook;
  v3 = [(BCReadingStatisticsProtoBook *)&v7 description];
  id v4 = [(BCReadingStatisticsProtoBook *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  assetID = self->_assetID;
  if (assetID) {
    [v3 setObject:assetID forKey:@"assetID"];
  }
  appVersion = self->_appVersion;
  if (appVersion) {
    [v4 setObject:appVersion forKey:@"appVersion"];
  }
  assetVersion = self->_assetVersion;
  if (assetVersion) {
    [v4 setObject:assetVersion forKey:@"assetVersion"];
  }
  if ([(NSMutableArray *)self->_tocEntrys count])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_tocEntrys, "count")];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = self->_tocEntrys;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"tocEntry"];
  }
  readCFIs = self->_readCFIs;
  if (readCFIs) {
    [v4 setObject:readCFIs forKey:@"readCFI"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCReadingStatisticsProtoBookReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  if (self->_assetVersion) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_tocEntrys;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_readCFIs;
  id v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  [v12 setAssetID:self->_assetID];
  [v12 setAppVersion:self->_appVersion];
  if (self->_assetVersion) {
    [v12 setAssetVersion:];
  }
  if ([(BCReadingStatisticsProtoBook *)self tocEntrysCount])
  {
    [v12 clearTocEntrys];
    unint64_t v4 = [(BCReadingStatisticsProtoBook *)self tocEntrysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(BCReadingStatisticsProtoBook *)self tocEntryAtIndex:i];
        [v12 addTocEntry:v7];
      }
    }
  }
  if ([(BCReadingStatisticsProtoBook *)self readCFIsCount])
  {
    [v12 clearReadCFIs];
    unint64_t v8 = [(BCReadingStatisticsProtoBook *)self readCFIsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(BCReadingStatisticsProtoBook *)self readCFIAtIndex:j];
        [v12 addReadCFI:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_assetID copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_appVersion copyWithZone:a3];
  unint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSString *)self->_assetVersion copyWithZone:a3];
  id v11 = (void *)v5[3];
  v5[3] = v10;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = self->_tocEntrys;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v16) copyWithZone:a3];
        [v5 addTocEntry:v17];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = self->_readCFIs;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      long long v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v22) copyWithZone:a3 v25];
        [v5 addReadCFI:v23];

        long long v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((assetID = self->_assetID, !((unint64_t)assetID | v4[2]))
     || -[NSString isEqual:](assetID, "isEqual:"))
    && ((appVersion = self->_appVersion, !((unint64_t)appVersion | v4[1]))
     || -[NSString isEqual:](appVersion, "isEqual:"))
    && ((assetVersion = self->_assetVersion, !((unint64_t)assetVersion | v4[3]))
     || -[NSString isEqual:](assetVersion, "isEqual:"))
    && ((tocEntrys = self->_tocEntrys, !((unint64_t)tocEntrys | v4[5]))
     || -[NSMutableArray isEqual:](tocEntrys, "isEqual:")))
  {
    readCFIs = self->_readCFIs;
    if ((unint64_t)readCFIs | v4[4]) {
      unsigned __int8 v10 = -[NSMutableArray isEqual:](readCFIs, "isEqual:");
    }
    else {
      unsigned __int8 v10 = 1;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assetID hash];
  unint64_t v4 = [(NSString *)self->_appVersion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_assetVersion hash];
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_tocEntrys hash];
  return v6 ^ (unint64_t)[(NSMutableArray *)self->_readCFIs hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[BCReadingStatisticsProtoBook setAssetID:](self, "setAssetID:");
  }
  if (*((void *)v4 + 1)) {
    -[BCReadingStatisticsProtoBook setAppVersion:](self, "setAppVersion:");
  }
  if (*((void *)v4 + 3)) {
    -[BCReadingStatisticsProtoBook setAssetVersion:](self, "setAssetVersion:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 5);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(BCReadingStatisticsProtoBook *)self addTocEntry:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 4);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[BCReadingStatisticsProtoBook addReadCFI:](self, "addReadCFI:", *(void *)(*((void *)&v15 + 1) + 8 * (void)j), (void)v15);
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSMutableArray)tocEntrys
{
  return self->_tocEntrys;
}

- (void)setTocEntrys:(id)a3
{
}

- (NSMutableArray)readCFIs
{
  return self->_readCFIs;
}

- (void)setReadCFIs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tocEntrys, 0);
  objc_storeStrong((id *)&self->_readCFIs, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetID, 0);

  objc_storeStrong((id *)&self->_appVersion, 0);
}

@end