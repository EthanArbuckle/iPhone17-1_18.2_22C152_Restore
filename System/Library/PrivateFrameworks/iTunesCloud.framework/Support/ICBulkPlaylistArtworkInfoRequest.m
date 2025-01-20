@interface ICBulkPlaylistArtworkInfoRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4;
@end

@implementation ICBulkPlaylistArtworkInfoRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v4 cloudIDs:v5 itemKind:1 useLongIDs:0];

  return v6;
}

@end