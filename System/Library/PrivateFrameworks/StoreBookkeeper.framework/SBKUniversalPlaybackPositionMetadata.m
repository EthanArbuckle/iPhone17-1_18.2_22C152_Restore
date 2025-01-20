@interface SBKUniversalPlaybackPositionMetadata
+ (BOOL)supportsSecureCoding;
+ (id)_testableMetadataItem_1;
+ (id)keyValueStoreItemIdentifierForItem:(id)a3;
+ (id)keyValueStoreItemIdentifierForUniqueStoreID:(int64_t)a3 itemTitle:(id)a4 albumName:(id)a5 itemArtistName:(id)a6 feedURL:(id)a7 feedGUID:(id)a8;
+ (id)metadataWithItemIdentifier:(id)a3 bookmarkTime:(double)a4 bookmarkTimestamp:(double)a5 hasBeenPlayed:(BOOL)a6 playCount:(unint64_t)a7;
+ (id)metadataWithItemIdentifier:(id)a3 keyValueStorePayload:(id)a4;
+ (id)metadataWithItemIdentifier:(id)a3 keyValueStorePayload:(id)a4 failuresOkay:(BOOL)a5;
+ (id)metadataWithValuesFromDataSourceItem:(id)a3;
+ (id)pairWithKVSKey:(id)a3 kvsPayload:(id)a4;
- (BOOL)hasBeenPlayed;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)itemIdentifier;
- (SBKUniversalPlaybackPositionMetadata)init;
- (SBKUniversalPlaybackPositionMetadata)initWithCoder:(id)a3;
- (double)bookmarkTime;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initAsTestableItem;
- (id)keyValueStorePayload;
- (unint64_t)hash;
- (unint64_t)playCount;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmarkTime:(double)a3;
- (void)setHasBeenPlayed:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setPlayCount:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation SBKUniversalPlaybackPositionMetadata

+ (id)keyValueStoreItemIdentifierForUniqueStoreID:(int64_t)a3 itemTitle:(id)a4 albumName:(id)a5 itemArtistName:(id)a6 feedURL:(id)a7 feedGUID:(id)a8
{
  v38[4] = *MEMORY[0x263EF8340];
  v13 = (__CFString *)a4;
  v14 = (__CFString *)a5;
  v15 = (__CFString *)a6;
  id v16 = a7;
  v17 = (__CFString *)a8;
  v18 = v17;
  if (!a3 || v16 || v17)
  {
    v20 = &stru_26DF10968;
    if (v13) {
      v21 = v13;
    }
    else {
      v21 = &stru_26DF10968;
    }
    v37[0] = @"title";
    v37[1] = @"albumTitle";
    if (v14) {
      v22 = v14;
    }
    else {
      v22 = &stru_26DF10968;
    }
    v38[0] = v21;
    v38[1] = v22;
    if (v15) {
      v23 = v15;
    }
    else {
      v23 = &stru_26DF10968;
    }
    v37[2] = @"artist";
    v37[3] = @"podcastGUID";
    if (v17) {
      v20 = v17;
    }
    v38[2] = v23;
    v38[3] = v20;
    v24 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
    v25 = (void *)[v24 mutableCopy];

    if (v16) {
      [v25 setObject:v16 forKeyedSubscript:@"podcastURL"];
    }
    v36[0] = @"podcastURL";
    v36[1] = @"podcastGUID";
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    v19 = storageItemIdentifierForProperties(v26, v25);

    if (!v19)
    {
      v35[0] = @"title";
      v35[1] = @"artist";
      v35[2] = @"albumTitle";
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
      v19 = storageItemIdentifierForProperties(v27, v25);

      if (!v19)
      {
        v34[0] = @"title";
        v34[1] = @"albumTitle";
        v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
        v19 = storageItemIdentifierForProperties(v28, v25);

        if (!v19)
        {
          v33[0] = @"title";
          v33[1] = @"artist";
          v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
          v19 = storageItemIdentifierForProperties(v29, v25);

          if (!v19)
          {
            v32 = @"title";
            v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
            v19 = storageItemIdentifierForProperties(v30, v25);
          }
        }
      }
    }
  }
  else
  {
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
  }

  return v19;
}

- (void).cxx_destruct
{
}

- (void)setPlayCount:(unint64_t)a3
{
  self->_playCount = a3;
}

- (unint64_t)playCount
{
  return self->_playCount;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (id)keyValueStorePayload
{
  v21[4] = *MEMORY[0x263EF8340];
  v3 = NSNumber;
  [(SBKUniversalPlaybackPositionMetadata *)self bookmarkTime];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SBKUniversalPlaybackPositionMetadata hasBeenPlayed](self, "hasBeenPlayed"));
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBKUniversalPlaybackPositionMetadata playCount](self, "playCount"));
  v7 = NSNumber;
  [(SBKUniversalPlaybackPositionMetadata *)self timestamp];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v9 = NSDictionary;
  v21[0] = v4;
  v21[1] = v5;
  v21[2] = v6;
  v21[3] = v8;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
  v11 = [v9 dictionaryWithObjects:v10 forKeys:&unk_26DF16CB0];

  id v16 = 0;
  v12 = [MEMORY[0x263F08AC0] dataWithPropertyList:v11 format:200 options:0 error:&v16];
  id v13 = v16;
  if (v13)
  {
    v14 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      __int16 v19 = 2114;
      id v20 = v13;
      _os_log_impl(&dword_22B807000, v14, OS_LOG_TYPE_ERROR, "SBKUniversalPlaybackPositionMetadata - error serializing data. %{public}@ error=%{public}@,", buf, 0x16u);
    }
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (double *)v4;
    BOOL v6 = [(NSString *)self->_itemIdentifier isEqual:*((void *)v5 + 2)]
      && self->_timestamp == v5[3]
      && self->_bookmarkTime == v5[4]
      && self->_hasBeenPlayed == *((unsigned __int8 *)v5 + 8)
      && self->_playCount == *((void *)v5 + 5);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_itemIdentifier hash] ^ self->_hasBeenPlayed ^ self->_playCount;
  id v4 = [NSNumber numberWithDouble:self->_bookmarkTime];
  uint64_t v5 = v3 ^ [v4 hash];
  BOOL v6 = [NSNumber numberWithDouble:self->_timestamp];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (double)timestamp
{
  double result = self->_timestamp;
  if (result <= -*MEMORY[0x263EFFAF0] || result == 0.0) {
    return -*MEMORY[0x263EFFAF0];
  }
  return result;
}

- (void)setTimestamp:(double)a3
{
  if (-*MEMORY[0x263EFFAF0] >= a3 || a3 == 0.0) {
    a3 = -*MEMORY[0x263EFFAF0];
  }
  self->_timestamp = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SBKUniversalPlaybackPositionMetadata);
  uint64_t v5 = [(SBKUniversalPlaybackPositionMetadata *)self itemIdentifier];
  [(SBKUniversalPlaybackPositionMetadata *)v4 setItemIdentifier:v5];

  [(SBKUniversalPlaybackPositionMetadata *)self timestamp];
  -[SBKUniversalPlaybackPositionMetadata setTimestamp:](v4, "setTimestamp:");
  [(SBKUniversalPlaybackPositionMetadata *)self bookmarkTime];
  -[SBKUniversalPlaybackPositionMetadata setBookmarkTime:](v4, "setBookmarkTime:");
  [(SBKUniversalPlaybackPositionMetadata *)v4 setHasBeenPlayed:[(SBKUniversalPlaybackPositionMetadata *)self hasBeenPlayed]];
  [(SBKUniversalPlaybackPositionMetadata *)v4 setPlayCount:[(SBKUniversalPlaybackPositionMetadata *)self playCount]];
  return v4;
}

- (NSString)description
{
  NSUInteger v3 = NSString;
  id v4 = [(SBKUniversalPlaybackPositionMetadata *)self itemIdentifier];
  uint64_t v5 = [v4 UTF8String];
  [(SBKUniversalPlaybackPositionMetadata *)self bookmarkTime];
  unint64_t v7 = [NSString stringWithFormat:@"%02llu:%02llu:%.2f", (unint64_t)(v6 / 3600.0), (unint64_t)((v6 - (double)(3600 * (unint64_t)(v6 / 3600.0))) / 60.0), v6- (double)(3600 * (unint64_t)(v6 / 3600.0))- (double)(60 * (unint64_t)((v6 - (double)(3600 * (unint64_t)(v6 / 3600.0))) / 60.0))];
  BOOL v8 = [(SBKUniversalPlaybackPositionMetadata *)self hasBeenPlayed];
  unint64_t v9 = [(SBKUniversalPlaybackPositionMetadata *)self playCount];
  [(SBKUniversalPlaybackPositionMetadata *)self timestamp];
  double v11 = v10;
  if (fabs(v10) <= 0.00000011920929)
  {
    v12 = @"no timestamp";
  }
  else if (v10 == 978307200.0)
  {
    v12 = @"*** 1970 timestamp ***";
  }
  else if (v10 == -978307200.0)
  {
    v12 = @"*** (-) 1970 timestamp ***";
  }
  else if (*MEMORY[0x263EFFAF0] == v10)
  {
    v12 = @"*** 1904 timestamp ***";
  }
  else if (v10 == -*MEMORY[0x263EFFAF0])
  {
    v12 = @"*** (-) 1904 timestamp ***";
  }
  else
  {
    v15 = [MEMORY[0x263EFF910] distantPast];
    [v15 timeIntervalSinceReferenceDate];
    double v17 = v16;

    if (v17 == v11)
    {
      v12 = @"*** distant past timestamp ***";
    }
    else
    {
      if (TimestampStringFromNSTimeInterval_onceToken != -1) {
        dispatch_once(&TimestampStringFromNSTimeInterval_onceToken, &__block_literal_global_676);
      }
      v18 = (void *)TimestampStringFromNSTimeInterval_dateFormatter;
      __int16 v19 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v11];
      uint64_t v20 = [v18 stringFromDate:v19];

      v21 = (void *)v20;
      v12 = [NSString stringWithFormat:@"(%f) %@", *(void *)&v11, v20];
    }
  }
  id v13 = [v3 stringWithFormat:@"<SBKMetadata:%p, id=%-32s, bktm=%@, hbpl=%d, plct=%llu, timestamp=%@>", self, v5, v7, v8, v9, v12];

  return (NSString *)v13;
}

- (void)encodeWithCoder:(id)a3
{
  itemIdentifier = self->_itemIdentifier;
  id v5 = a3;
  [v5 encodeObject:itemIdentifier forKey:@"itemIdentifier"];
  [v5 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v5 encodeDouble:@"bookmarkTime" forKey:self->_bookmarkTime];
  [v5 encodeBool:self->_hasBeenPlayed forKey:@"hasBeenPlayed"];
  [v5 encodeInteger:self->_playCount forKey:@"playCount"];
}

- (SBKUniversalPlaybackPositionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBKUniversalPlaybackPositionMetadata;
  id v5 = [(SBKUniversalPlaybackPositionMetadata *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v8;
    [v4 decodeDoubleForKey:@"bookmarkTime"];
    v5->_bookmarkTime = v9;
    v5->_hasBeenPlayed = [v4 decodeBoolForKey:@"hasBeenPlayed"];
    v5->_playCount = [v4 decodeIntegerForKey:@"playCount"];
  }

  return v5;
}

- (id)initAsTestableItem
{
  v6.receiver = self;
  v6.super_class = (Class)SBKUniversalPlaybackPositionMetadata;
  v2 = [(SBKUniversalPlaybackPositionMetadata *)&v6 init];
  NSUInteger v3 = v2;
  if (v2)
  {
    itemIdentifier = v2->_itemIdentifier;
    v2->_itemIdentifier = (NSString *)@"test-item-identifier";

    v3->_hasBeenPlayed = 1;
    v3->_playCount = 10;
    *(_OWORD *)&v3->_timestamp = xmmword_22B8294D0;
  }
  return v3;
}

- (SBKUniversalPlaybackPositionMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBKUniversalPlaybackPositionMetadata;
  return [(SBKUniversalPlaybackPositionMetadata *)&v3 init];
}

+ (id)metadataWithItemIdentifier:(id)a3 keyValueStorePayload:(id)a4 failuresOkay:(BOOL)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v41 = 0;
    double v10 = [MEMORY[0x263F08AC0] propertyListWithData:v9 options:1 format:0 error:&v41];
    id v11 = v41;
    if (v11)
    {
      v12 = v11;
      id v5 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v43 = v12;
        _os_log_impl(&dword_22B807000, v5, OS_LOG_TYPE_ERROR, "SBKUniversalPlaybackPositionMetadata - error deserializing data. error=%{public}@,", buf, 0xCu);
      }
    }
    if (v10)
    {
      id v13 = 0;
    }
    else
    {
      id v40 = 0;
      id v5 = [objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v9 error:&v40];
      id v13 = v40;
      [v5 setDecodingFailurePolicy:0];
      v15 = (void *)MEMORY[0x263EFFA08];
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      __int16 v19 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
      double v10 = [v5 decodeObjectOfClasses:v19 forKey:*MEMORY[0x263F081D0]];

      [v5 finishDecoding];
      if (!v10)
      {
        if (!a5)
        {
          v33 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v8;
            _os_log_impl(&dword_22B807000, v33, OS_LOG_TYPE_ERROR, "SBKUniversalPlaybackPositionMetadata - encountered invalid data while unarchiving payload for itemIdentifier: %@", buf, 0xCu);
          }
          double v10 = 0;
          v14 = 0;
          goto LABEL_56;
        }
        double v10 = 0;
        goto LABEL_52;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_52;
    }
    uint64_t v20 = [v10 objectForKey:@"pver"];
    if (!v20
      || ([v10 objectForKey:@"pver"],
          id v5 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = [v10 objectForKey:@"pver"];
      v22 = (void *)[v23 integerValue];

      if (!v20) {
        goto LABEL_18;
      }
    }
    else
    {
      v21 = [v10 objectForKey:@"pver"];
      v22 = (void *)[v21 integerValue];
    }
LABEL_18:

    if (!v22)
    {
      v14 = objc_alloc_init(SBKUniversalPlaybackPositionMetadata);
      [(SBKUniversalPlaybackPositionMetadata *)v14 setItemIdentifier:v8];
      v24 = [v10 objectForKey:@"bktm"];
      if (!v24
        || ([v10 objectForKey:@"bktm"],
            v22 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        v26 = [v10 objectForKey:@"bktm"];
        [v26 doubleValue];
        -[SBKUniversalPlaybackPositionMetadata setBookmarkTime:](v14, "setBookmarkTime:");

        if (!v24)
        {
LABEL_24:

          v27 = [v10 objectForKey:@"hbpl"];
          if (!v27
            || ([v10 objectForKey:@"hbpl"],
                v22 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            v29 = [v10 objectForKey:@"hbpl"];
            -[SBKUniversalPlaybackPositionMetadata setHasBeenPlayed:](v14, "setHasBeenPlayed:", [v29 BOOLValue]);

            if (!v27)
            {
LABEL_29:

              v30 = [v10 objectForKey:@"plct"];
              if (!v30
                || ([v10 objectForKey:@"plct"],
                    v22 = objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    (objc_opt_isKindOfClass() & 1) != 0))
              {
                v32 = [v10 objectForKey:@"plct"];
                -[SBKUniversalPlaybackPositionMetadata setPlayCount:](v14, "setPlayCount:", [v32 integerValue]);

                if (!v30) {
                  goto LABEL_34;
                }
              }
              else
              {
                v31 = [v10 objectForKey:@"plct"];
                -[SBKUniversalPlaybackPositionMetadata setPlayCount:](v14, "setPlayCount:", [v31 integerValue]);
              }
LABEL_34:

              v33 = [v10 objectForKey:@"tstm"];
              if (!v33
                || ([v10 objectForKey:@"tstm"],
                    v22 = objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    (objc_opt_isKindOfClass() & 1) != 0))
              {
                v34 = [v10 objectForKey:@"tstm"];
                int v36 = 0;
                int v35 = 1;
              }
              else
              {
                v34 = [v10 objectForKey:@"tstm"];
                int v35 = 0;
                int v36 = 1;
              }
              [v34 doubleValue];
              if (v37 <= -*MEMORY[0x263EFFAF0] || v37 == 0.0) {
                double v37 = -*MEMORY[0x263EFFAF0];
              }
              [(SBKUniversalPlaybackPositionMetadata *)v14 setTimestamp:v37];
              if (v36) {

              }
              if (v35) {
              if (v33)
              }

LABEL_56:
              goto LABEL_57;
            }
          }
          else
          {
            v28 = [v10 objectForKey:@"hbpl"];
            -[SBKUniversalPlaybackPositionMetadata setHasBeenPlayed:](v14, "setHasBeenPlayed:", [v28 BOOLValue]);
          }
          goto LABEL_29;
        }
      }
      else
      {
        v25 = [v10 objectForKey:@"bktm"];
        [v25 doubleValue];
        -[SBKUniversalPlaybackPositionMetadata setBookmarkTime:](v14, "setBookmarkTime:");
      }
      goto LABEL_24;
    }
LABEL_52:
    v14 = 0;
LABEL_57:

    goto LABEL_58;
  }
  double v10 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B807000, v10, OS_LOG_TYPE_ERROR, "SBKUniversalPlaybackPositionMetadata - keyValueStorePayload=nil", buf, 2u);
  }
  v14 = 0;
LABEL_58:

  return v14;
}

+ (id)metadataWithItemIdentifier:(id)a3 keyValueStorePayload:(id)a4
{
  return (id)[a1 metadataWithItemIdentifier:a3 keyValueStorePayload:a4 failuresOkay:0];
}

+ (id)metadataWithItemIdentifier:(id)a3 bookmarkTime:(double)a4 bookmarkTimestamp:(double)a5 hasBeenPlayed:(BOOL)a6 playCount:(unint64_t)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  v12 = objc_alloc_init(SBKUniversalPlaybackPositionMetadata);
  [(SBKUniversalPlaybackPositionMetadata *)v12 setItemIdentifier:v11];

  [(SBKUniversalPlaybackPositionMetadata *)v12 setTimestamp:a5];
  [(SBKUniversalPlaybackPositionMetadata *)v12 setBookmarkTime:a4];
  [(SBKUniversalPlaybackPositionMetadata *)v12 setHasBeenPlayed:v8];
  [(SBKUniversalPlaybackPositionMetadata *)v12 setPlayCount:a7];
  return v12;
}

+ (id)metadataWithValuesFromDataSourceItem:(id)a3
{
  objc_super v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 alloc];
  objc_super v6 = [NSNumber numberWithDouble:0.0];
  unint64_t v7 = NSNumber;
  BOOL v8 = [MEMORY[0x263EFF910] distantPast];
  [v8 timeIntervalSinceReferenceDate];
  id v9 = objc_msgSend(v7, "numberWithDouble:");
  double v10 = [NSNumber numberWithBool:0];
  id v11 = [NSNumber numberWithInteger:0];
  v12 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, @"bookmarkTime", v9, @"bookmarkMetadataTimestamp", v10, @"hasBeenPalyed", v11, @"playCount", 0);

  id v13 = (void *)MEMORY[0x263EFFA08];
  v14 = [v12 allKeys];
  v15 = [v13 setWithArray:v14];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __77__SBKUniversalPlaybackPositionMetadata_metadataWithValuesFromDataSourceItem___block_invoke;
  v24[3] = &unk_2648AF188;
  id v25 = v12;
  id v16 = v12;
  [v4 enumerateValuesForProperties:v15 usingBlock:v24];

  uint64_t v17 = objc_alloc_init(SBKUniversalPlaybackPositionMetadata);
  uint64_t v18 = +[SBKUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:v4];

  [(SBKUniversalPlaybackPositionMetadata *)v17 setItemIdentifier:v18];
  __int16 v19 = [v16 valueForKey:@"bookmarkMetadataTimestamp"];
  [v19 doubleValue];
  -[SBKUniversalPlaybackPositionMetadata setTimestamp:](v17, "setTimestamp:");

  uint64_t v20 = [v16 valueForKey:@"bookmarkTime"];
  [v20 doubleValue];
  -[SBKUniversalPlaybackPositionMetadata setBookmarkTime:](v17, "setBookmarkTime:");

  v21 = [v16 valueForKey:@"hasBeenPalyed"];
  -[SBKUniversalPlaybackPositionMetadata setHasBeenPlayed:](v17, "setHasBeenPlayed:", [v21 BOOLValue]);

  v22 = [v16 valueForKey:@"playCount"];
  -[SBKUniversalPlaybackPositionMetadata setPlayCount:](v17, "setPlayCount:", [v22 integerValue]);

  return v17;
}

uint64_t __77__SBKUniversalPlaybackPositionMetadata_metadataWithValuesFromDataSourceItem___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(result + 32) setObject:a3 forKey:a2];
  }
  return result;
}

+ (id)keyValueStoreItemIdentifierForItem:(id)a3
{
  v32[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v32[0] = @"storeItemAdamID";
  v32[1] = @"subscriptionStoreItemAdamID";
  v32[2] = @"mediaEntityType";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
  id v5 = valuesForProperties(v3, v4);
  objc_super v6 = [v5 objectForKey:@"mediaEntityType"];
  uint64_t v7 = [v6 integerValue];

  BOOL v8 = [v5 objectForKey:@"storeItemAdamID"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v10 = [v5 objectForKey:@"storeItemAdamID"];
  id v11 = v10;
  if (isKindOfClass) {
    uint64_t v12 = [v10 longLongValue];
  }
  else {
    uint64_t v12 = [v10 unsignedLongLongValue];
  }
  uint64_t v13 = v12;

  if (!v13)
  {
    v14 = [v5 objectForKey:@"subscriptionStoreItemAdamID"];
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();
    id v16 = [v5 objectForKey:@"subscriptionStoreItemAdamID"];
    uint64_t v17 = v16;
    if (v15) {
      uint64_t v18 = [v16 longLongValue];
    }
    else {
      uint64_t v18 = [v16 unsignedLongLongValue];
    }
    uint64_t v13 = v18;
  }
  if (v13 && v7 != 3 && v7 != 4)
  {
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v13);
LABEL_13:
    uint64_t v20 = (void *)v19;
    goto LABEL_16;
  }
  v31[0] = @"podcastURL";
  v31[1] = @"podcastGUID";
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];

  v22 = valuesForProperties(v3, v21);

  uint64_t v23 = storageItemIdentifierForProperties(v21, v22);
  if (v23) {
    goto LABEL_15;
  }
  v30[0] = @"title";
  v30[1] = @"artist";
  v30[2] = @"albumTitle";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];

  id v5 = valuesForProperties(v3, v4);

  uint64_t v19 = storageItemIdentifierForProperties(v4, v5);
  if (v19) {
    goto LABEL_13;
  }
  v29[0] = @"title";
  v29[1] = @"albumTitle";
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];

  v22 = valuesForProperties(v3, v21);

  uint64_t v23 = storageItemIdentifierForProperties(v21, v22);
  if (v23)
  {
LABEL_15:
    uint64_t v20 = (void *)v23;
    id v4 = v21;
    id v5 = v22;
  }
  else
  {
    v28[0] = @"title";
    v28[1] = @"artist";
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];

    id v5 = valuesForProperties(v3, v4);

    uint64_t v19 = storageItemIdentifierForProperties(v4, v5);
    if (v19) {
      goto LABEL_13;
    }
    v27 = @"title";
    id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];

    v26 = valuesForProperties(v3, v25);

    uint64_t v20 = storageItemIdentifierForProperties(v25, v26);
    id v4 = v25;
    id v5 = v26;
  }
LABEL_16:

  return v20;
}

+ (id)_testableMetadataItem_1
{
  v2 = (void *)[objc_alloc((Class)a1) initAsTestableItem];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)pairWithKVSKey:(id)a3 kvsPayload:(id)a4
{
  return +[SBKUniversalPlaybackPositionMetadata metadataWithItemIdentifier:a3 keyValueStorePayload:a4 failuresOkay:0];
}

@end