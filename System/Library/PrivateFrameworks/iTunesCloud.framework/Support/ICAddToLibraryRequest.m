@interface ICAddToLibraryRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 containerID:(unsigned int)a6 referralAlbumAdamID:(int64_t)a7 referralPlaylistGlobalID:(id)a8;
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 referralAlbumAdamID:(int64_t)a6 referralPlaylistGlobalID:(id)a7;
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistGlobalID:(id)a5;
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 sagaID:(int64_t)a5 containerID:(unsigned int)a6;
- (ICAddToLibraryRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 sagaID:(int64_t)a6 playlistGlobalID:(id)a7 containerID:(unsigned int)a8 referralAlbumAdamID:(int64_t)a9 referralPlaylistGlobalID:(id)a10;
- (double)timeoutInterval;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 adamID:(int64_t)a4 sagaID:(int64_t)a5 playlistGlobalID:(id)a6 referralAlbumAdamID:(int64_t)a7 referralPlaylistGlobalID:(id)a8;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICAddToLibraryRequest

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 adamID:(int64_t)a4 sagaID:(int64_t)a5 playlistGlobalID:(id)a6 referralAlbumAdamID:(int64_t)a7 referralPlaylistGlobalID:(id)a8
{
  id v9 = a6;
  id v14 = a8;
  id v10 = v14;
  id v11 = v9;
  v12 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v12;
}

- (double)timeoutInterval
{
  return 120.0;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  if ([v4 length])
  {
    v5 = +[NSInputStream inputStreamWithData:v4];
    id v6 = [objc_alloc((Class)DKDAAPParser) initWithStream:v5];
    v7 = objc_alloc_init(AddToLibraryResponseParserDelegate);
    [v6 setDelegate:v7];
    [v6 parse];
    v8 = [(AddToLibraryResponseParserDelegate *)v7 addedItems];
    id v9 = [v8 copy];
    [v3 setAddedItems:v9];

    objc_msgSend(v3, "setUpdateRequired:", -[AddToLibraryResponseParserDelegate updateRequired](v7, "updateRequired"));
  }

  return v3;
}

- (ICAddToLibraryRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 sagaID:(int64_t)a6 playlistGlobalID:(id)a7 containerID:(unsigned int)a8 referralAlbumAdamID:(int64_t)a9 referralPlaylistGlobalID:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = *(void *)&a3;
  id v17 = a7;
  id v18 = a10;
  if (a5 && v17)
  {
    v24 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ICAddToLibraryRequest.m", 43, @"You can only send one field (adam-id or playlist-global-id");
  }
  else if (!v17)
  {
    goto LABEL_5;
  }
  if (v10)
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"ICAddToLibraryRequest.m" lineNumber:45 description:@"You can not add a playlist-global-id to a container"];

    goto LABEL_6;
  }
LABEL_5:
  if (v10)
  {
LABEL_6:
    +[NSString stringWithFormat:@"databases/%u/containers/%u/cloud-add", v14, v10];
    goto LABEL_8;
  }
  +[NSString stringWithFormat:@"databases/%u/cloud-add", v14, v26];
  v19 = LABEL_8:;
  v27.receiver = self;
  v27.super_class = (Class)ICAddToLibraryRequest;
  v20 = [(ICDRequest *)&v27 initWithAction:v19];
  v21 = v20;
  if (v20)
  {
    [(ICDRequest *)v20 setMethod:1];
    v22 = [(ICAddToLibraryRequest *)v21 _bodyDataForDatabaseRevision:v13 adamID:a5 sagaID:a6 playlistGlobalID:v17 referralAlbumAdamID:a9 referralPlaylistGlobalID:v18];
    [(ICDRequest *)v21 setBodyData:v22];
  }
  return v21;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistGlobalID:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v9 = a5;
  if (![v9 length])
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:83 description:@"playlist-global-id must be a non-zero length string."];
  }
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v6 databaseRevision:v5 adamID:0 sagaID:0 playlistGlobalID:v9 containerID:0 referralAlbumAdamID:0 referralPlaylistGlobalID:0];

  return v10;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 sagaID:(int64_t)a5 containerID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  if (a5)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:77 description:@"saga-id cannot be zero."];

    if (v6) {
      goto LABEL_3;
    }
  }
  v15 = +[NSAssertionHandler currentHandler];
  [v15 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:78 description:@"container-id cannot be zero."];

LABEL_3:
  id v12 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v9 databaseRevision:v8 adamID:0 sagaID:a5 playlistGlobalID:0 containerID:v6 referralAlbumAdamID:0 referralPlaylistGlobalID:0];

  return v12;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 containerID:(unsigned int)a6 referralAlbumAdamID:(int64_t)a7 referralPlaylistGlobalID:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  id v15 = a8;
  if (a5)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:71 description:@"container-id cannot be zero."];

    if (!a7) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  id v18 = +[NSAssertionHandler currentHandler];
  [v18 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:70 description:@"adam-id cannot be zero."];

  if (!v9) {
    goto LABEL_10;
  }
LABEL_3:
  if (!a7) {
    goto LABEL_6;
  }
LABEL_4:
  if ([v15 length])
  {
    v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:72 description:@"cannot specify more than one referral"];
  }
LABEL_6:
  id v16 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v12 databaseRevision:v11 adamID:a5 sagaID:0 playlistGlobalID:0 containerID:v9 referralAlbumAdamID:a7 referralPlaylistGlobalID:v15];

  return v16;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 referralAlbumAdamID:(int64_t)a6 referralPlaylistGlobalID:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v13 = a7;
  if (a5)
  {
    if (!a6) {
      goto LABEL_5;
    }
  }
  else
  {
    id v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:64 description:@"adam-id cannot be zero."];

    if (!a6) {
      goto LABEL_5;
    }
  }
  if ([v13 length])
  {
    id v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:65 description:@"cannot specify more than one referral"];
  }
LABEL_5:
  id v14 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v10 databaseRevision:v9 adamID:a5 sagaID:0 playlistGlobalID:0 containerID:0 referralAlbumAdamID:a6 referralPlaylistGlobalID:v13];

  return v14;
}

@end