@interface SBDPlaybackPositionMediaItem
- (NSString)identifier;
- (SBCPlaybackPositionEntity)entity;
- (SBDPlaybackPositionMediaItem)initWithUbiquitousIdentifier:(id)a3 inLibrary:(id)a4;
- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4;
@end

@implementation SBDPlaybackPositionMediaItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (SBCPlaybackPositionEntity)entity
{
  return self->_entity;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void *, unsigned char *))a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    uint64_t v11 = SBKUniversalPlaybackPositionMediaItemPropertySubscriptionStoreID;
    uint64_t v23 = SBKUniversalPlaybackPositionMediaItemPropertyBookmarkTime;
    uint64_t v24 = SBKUniversalPlaybackPositionMediaItemPropertyPlayCount;
    uint64_t v21 = SBKUniversalPlaybackPositionMediaItemPropertyMetadataTimestamp;
    uint64_t v22 = SBKUniversalPlaybackPositionMediaItemPropertyHasBeenPlayed;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v12);
        if (objc_msgSend(v13, "isEqualToString:", v11, v21))
        {
          v14 = [(SBDPlaybackPositionMediaItem *)self entity];
          uint64_t v15 = [v14 ubiquitousIdentifier];
          goto LABEL_15;
        }
        if ([v13 isEqualToString:v24])
        {
          v14 = [(SBDPlaybackPositionMediaItem *)self entity];
          uint64_t v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 userPlayCount]);
          goto LABEL_15;
        }
        if ([v13 isEqualToString:v23])
        {
          v14 = [(SBDPlaybackPositionMediaItem *)self entity];
          [v14 bookmarkTime];
          double v17 = v16 / 1000.0;
          goto LABEL_12;
        }
        if ([v13 isEqualToString:v22])
        {
          v14 = [(SBDPlaybackPositionMediaItem *)self entity];
          uint64_t v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v14 hasBeenPlayed]);
          goto LABEL_15;
        }
        if ([v13 isEqualToString:v21])
        {
          v14 = [(SBDPlaybackPositionMediaItem *)self entity];
          [v14 bookmarkTimestamp];
LABEL_12:
          uint64_t v15 = +[NSNumber numberWithDouble:v17];
LABEL_15:
          v18 = (void *)v15;

          goto LABEL_16;
        }
        v18 = 0;
LABEL_16:
        unsigned __int8 v26 = 0;
        v7[2](v7, v13, v18, &v26);
        int v19 = v26;

        if (v19) {
          goto LABEL_23;
        }
        v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v20 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v9 = v20;
    }
    while (v20);
  }
LABEL_23:
}

- (SBDPlaybackPositionMediaItem)initWithUbiquitousIdentifier:(id)a3 inLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBDPlaybackPositionMediaItem;
  id v9 = [(SBDPlaybackPositionMediaItem *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    uint64_t v11 = [v8 uppDatabase];
    v12 = MSVTCCIdentityForCurrentProcess();
    uint64_t v13 = [v11 readUbiquitousDatabaseMetadataValuesWithClientIdentity:v12 identifier:v10->_identifier];
    entity = v10->_entity;
    v10->_entity = (SBCPlaybackPositionEntity *)v13;
  }
  return v10;
}

@end