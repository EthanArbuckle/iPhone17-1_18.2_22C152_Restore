@interface ICSDKAddToPlaylistRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 opaqueID:(id)a5 bundleID:(id)a6 containerID:(unsigned int)a7;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 opaqueID:(id)a4;
@end

@implementation ICSDKAddToPlaylistRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 opaqueID:(id)a5 bundleID:(id)a6 containerID:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v11 = a6;
  id v12 = a5;
  v13 = +[NSString stringWithFormat:@"databases/%u/containers/%u/cloud-add", v10, v7];
  id v14 = [objc_alloc((Class)objc_opt_class()) initWithAction:v13 databaseID:v10 databaseRevision:v9 opaqueID:v12 bundleID:v11];

  return v14;
}

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 opaqueID:(id)a4
{
  id v7 = a4;
  id v4 = v7;
  v5 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v5;
}

@end