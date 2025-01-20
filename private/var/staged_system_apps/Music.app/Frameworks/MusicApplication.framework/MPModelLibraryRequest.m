@interface MPModelLibraryRequest
- (id)playbackIntentFor:(id)a3 itemKind:(id)a4 itemProperties:(id)a5;
- (id)requestForDetailFor:(id)a3 kind:(id)a4 requestedProperties:(id)a5;
- (void)updateAlbumLibraryDataIfNeededWithModelAlbum:(id)a3 containerDetailViewModel:(id)a4;
@end

@implementation MPModelLibraryRequest

- (id)requestForDetailFor:(id)a3 kind:(id)a4 requestedProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_23A4EC(v8, (uint64_t)v9, (uint64_t)v10);

  return v12;
}

- (void)updateAlbumLibraryDataIfNeededWithModelAlbum:(id)a3 containerDetailViewModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_23A6FC((uint64_t)v6, (uint64_t)v7);
}

- (id)playbackIntentFor:(id)a3 itemKind:(id)a4 itemProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_23B084(v8, (uint64_t)v9, (uint64_t)v10);

  return v12;
}

@end