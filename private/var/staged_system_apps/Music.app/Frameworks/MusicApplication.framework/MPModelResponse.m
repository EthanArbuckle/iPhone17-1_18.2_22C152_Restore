@interface MPModelResponse
- (BOOL)hasVideoArtwork;
- (BOOL)hasVideoArtworkAt:(id)a3;
@end

@implementation MPModelResponse

- (BOOL)hasVideoArtwork
{
  return variable initialization expression of Library.Context.useDownloadedContentOnly() & 1;
}

- (BOOL)hasVideoArtworkAt:(id)a3
{
  uint64_t v3 = sub_AB1110();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  char v7 = variable initialization expression of Library.Context.useDownloadedContentOnly();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

@end