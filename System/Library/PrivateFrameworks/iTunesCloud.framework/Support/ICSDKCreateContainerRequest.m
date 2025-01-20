@interface ICSDKCreateContainerRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7;
- (ICSDKCreateContainerRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7;
@end

@implementation ICSDKCreateContainerRequest

- (void).cxx_destruct
{
}

- (ICSDKCreateContainerRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)ICSDKCreateContainerRequest;
  v13 = [(ICCreateContainerRequest *)&v16 initWithDatabaseID:v10 databaseRevision:v9 playlistProperties:a5 trackList:a6];
  v14 = v13;
  if (v13) {
    [(ICDRequest *)v13 setRequestingBundleID:v12];
  }

  return v14;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v10 databaseRevision:v9 playlistProperties:v13 trackList:v12 requestingBundleID:v11];

  return v14;
}

@end