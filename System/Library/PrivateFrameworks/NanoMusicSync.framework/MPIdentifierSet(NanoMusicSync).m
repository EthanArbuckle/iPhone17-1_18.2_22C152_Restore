@interface MPIdentifierSet(NanoMusicSync)
+ (id)nms_identifierSetWithLibraryPersistentID:()NanoMusicSync modelKind:;
- (id)nms_syncInfoAlbumIdentifier;
- (id)nms_syncInfoPlaylistIdentifier;
- (id)nms_universalStoreLookupID;
@end

@implementation MPIdentifierSet(NanoMusicSync)

- (id)nms_universalStoreLookupID
{
  v2 = [a1 universalStore];
  v3 = [v2 globalPlaylistID];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = NSNumber;
    v7 = [a1 universalStore];
    v8 = objc_msgSend(v6, "numberWithLongLong:", objc_msgSend(v7, "adamID"));
    v9 = MPStoreItemMetadataStringNormalizeStoreIDValue();
    v10 = v9;
    if (v9)
    {
      id v5 = v9;
    }
    else
    {
      v11 = [a1 universalStore];
      id v5 = [v11 universalCloudLibraryID];
    }
  }

  return v5;
}

- (id)nms_syncInfoPlaylistIdentifier
{
  v2 = [a1 universalStore];
  v3 = [v2 globalPlaylistID];

  if (v3)
  {
    v4 = [a1 universalStore];
    id v5 = [v4 globalPlaylistID];
  }
  else
  {
    v6 = [a1 personalizedStore];
    uint64_t v7 = [v6 cloudID];

    v8 = NSNumber;
    if (v7)
    {
      v4 = [a1 personalizedStore];
      objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v4, "cloudID"));
    }
    else
    {
      v4 = [a1 library];
      objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v4, "persistentID"));
    v9 = };
    id v5 = [v9 stringValue];
  }

  return v5;
}

- (id)nms_syncInfoAlbumIdentifier
{
  v2 = [a1 universalStore];
  uint64_t v3 = [v2 adamID];

  if (v3)
  {
    v4 = NSNumber;
    id v5 = [a1 universalStore];
    uint64_t v6 = [v5 adamID];
LABEL_3:
    uint64_t v7 = [v4 numberWithLongLong:v6];
    v8 = [v7 stringValue];

    goto LABEL_6;
  }
  v9 = [a1 personalizedStore];
  v10 = [v9 cloudAlbumID];

  if (!v10)
  {
    v4 = NSNumber;
    id v5 = [a1 library];
    uint64_t v6 = [v5 persistentID];
    goto LABEL_3;
  }
  id v5 = [a1 personalizedStore];
  v8 = [v5 cloudAlbumID];
LABEL_6:

  return v8;
}

+ (id)nms_identifierSetWithLibraryPersistentID:()NanoMusicSync modelKind:
{
  id v6 = a4;
  id v7 = [a1 alloc];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__MPIdentifierSet_NanoMusicSync__nms_identifierSetWithLibraryPersistentID_modelKind___block_invoke;
  v10[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
  v10[4] = a3;
  v8 = (void *)[v7 initWithModelKind:v6 block:v10];

  return v8;
}

@end